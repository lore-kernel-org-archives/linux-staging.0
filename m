Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425FAD25
	for <linux-staging@lists.linux.dev>; Fri,  4 Nov 2022 19:51:11 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id l15so3666733qtv.4
        for <linux-staging@lists.linux.dev>; Fri, 04 Nov 2022 12:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x16jINQR4q6R4H/0ehn+NSarZW0ZiXtTfCfHHiaRLp4=;
        b=bIdKEWgR5UZIy0TJaruQujMahMwynr4PVMnDcU4kBitHBNo7q073JbrYzG65FbHP7Y
         mbM9hFjlLlwQAouSAl9oSuR5cXI0K/JQyyZwmKs1co0JGtwjHN72PIS9n6MKeTRWxT7Z
         cCPuFkDzNQGR2KqOHNVW0/FBQA0CMharaPptg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x16jINQR4q6R4H/0ehn+NSarZW0ZiXtTfCfHHiaRLp4=;
        b=uAoutx9rvEDweLBZ+oILmk/JfcqOCaENukreRMivWXfq3yUMGeSVajgYhaEMzLp5qE
         1nkFASlD2RpIPexQPTAymnw8qVWmS2KOBiv+9x6J0rrG/I2+5whmPwwuLIyzW5APOoNS
         FrM6hPynN+7vV+CE1X5qhC/tAMeDrbWFVCLcJGMZAF7YBBehbyG/ktyKMOOwOk8I/OvH
         hvL0K9QHO8yW25oXJaZzHhJdo9iAn0vSQc1Yaycan9uhFCKLm2LbqFrldnJjTRGedRhC
         7d4CU9XWgKqfybJT0l0KMcRJ4fI2JdGpuRwCtfdsRnSPs4s2RgUN4c3cRB56XHju30RQ
         RwPA==
X-Gm-Message-State: ACrzQf1/Ut2gYfiR6oYn38IO8wULc0FUqet0ceUIMXJjifLyhl/sfidh
	c+Mo2G42/KPUlZn3Z4NbWlR1C0U8iklJiA==
X-Google-Smtp-Source: AMsMyM5hdNqr4oTv/Bi+oGYYcSKroSVw/HPKYrgxsiwAWw6ChoACmC1RoecQaresHXGG/jGjZYgXIA==
X-Received: by 2002:a05:622a:83:b0:39c:fa14:efeb with SMTP id o3-20020a05622a008300b0039cfa14efebmr30513201qtw.643.1667591470230;
        Fri, 04 Nov 2022 12:51:10 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id u14-20020a05620a430e00b006b640efe6dasm13524qko.132.2022.11.04.12.51.09
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 12:51:09 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-3704852322fso52917497b3.8
        for <linux-staging@lists.linux.dev>; Fri, 04 Nov 2022 12:51:09 -0700 (PDT)
X-Received: by 2002:a0d:ef07:0:b0:373:5257:f897 with SMTP id
 y7-20020a0def07000000b003735257f897mr16823922ywe.401.1667591459021; Fri, 04
 Nov 2022 12:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221104054053.431922658@goodmis.org> <20221104192232.GA2520396@roeck-us.net>
 <20221104154209.21b26782@rorschach.local.home>
In-Reply-To: <20221104154209.21b26782@rorschach.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Nov 2022 12:50:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wge9uWV2i9PR6x7va4ZbPdX5+rg7Ep1UNH_nYdd9rD-uw@mail.gmail.com>
Message-ID: <CAHk-=wge9uWV2i9PR6x7va4ZbPdX5+rg7Ep1UNH_nYdd9rD-uw@mail.gmail.com>
Subject: Re: [RFC][PATCH v3 00/33] timers: Use timer_shutdown*() before
 freeing timers
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Anna-Maria Gleixner <anna-maria@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, 
	rcu@vger.kernel.org, linux-doc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
	linux-pm@vger.kernel.org, drbd-dev@lists.linbit.com, 
	linux-bluetooth@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org, 
	linux-input@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-leds@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org, 
	bridge@lists.linux-foundation.org, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, lvs-devel@vger.kernel.org, 
	linux-afs@lists.infradead.org, linux-nfs@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 4, 2022 at 12:42 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Linus, should I also add any patches that has already been acked by the
> respective maintainer?

No, I'd prefer to keep only the ones that are 100% unambiguously not
changing any semantics.

              Linus
