Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91779BD39
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 08:49:59 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id l12so5538537edb.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 00:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cPF3S5LWjJlkZTrjV9Y73itlCeuHZIzU03BM/+gPvQM=;
        b=PbzIRdfIqKifArM2ew4zN4MoWgH1obTY0K7gfUmkXO36MoI0VdJDSmpzZvZE016XQS
         XBWWlxPCcJXRB+3GljRFv3eVIwaIuBGdwK1k/mbP1tf9+V9a4fp5FtjrvAmAaP0icgK6
         5nwCaGG3vvChOwiEuNoQCLc97hC1ebtdsSj1Ft4x0ogCbtFSES5xJza60hhNQhc4cyQr
         GwVNcrIGgh8LZd3BIJbjATPg+IRB7w95GXB/icylTDJf9NI5RDZiYwXGrM/a0x2/K6JT
         6l4otuL6/1SLz9fUPJaQLExhEpVpoxTZtHmCZAIS7Cd1lVuZdn+IROeXMnHSYDu9u7DQ
         eESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPF3S5LWjJlkZTrjV9Y73itlCeuHZIzU03BM/+gPvQM=;
        b=WII0jrBKW5rdm0FjfTzuk21niC8rsYs9NWbYnxVjwW867f6+lk0mt5Ythv57IHhOVf
         61jlPQm/JaqK2r7n0dWljwQ2gN/oyO20+UHu1h66qis55alCISlcyTcWriW74TkOvaV2
         TAEbjvDLAZ14B3Ky59oy4d5nHazYdShJLpj0fQQmoLOIrJbW7JCB1yLh2QjeS/1IFHy8
         AhzDi1qgNYYYtDtmgBRlH9KyixzCT0dirDYDBaJ1TN/RaePZFj2xCh4lDvOO1RkWTDLt
         hHfeR7WN4rwOOBCB39waJR3tU7Zw5s/2F7omK6PebFYcUlDMlSf4mbV+LiopG6YmVoLp
         0xNg==
X-Gm-Message-State: AO0yUKXspeiSooOordpC9rM2gdNM9UxUjkyTbct5jmEQWdeYG/DaGVo0
	BfJmpxZ8wC6t8RHUytWpDXg=
X-Google-Smtp-Source: AK7set9A1knvIGVWuHJUr4x35s1L2zt9irEF/Hck8YdKqktqiZBTaIx3AStOsDcBWAJSkXAkUsX1yg==
X-Received: by 2002:a50:cd03:0:b0:4a1:e4fa:7db2 with SMTP id z3-20020a50cd03000000b004a1e4fa7db2mr2482123edi.17.1675759797892;
        Tue, 07 Feb 2023 00:49:57 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id q22-20020a50aa96000000b004aab66483ddsm1815310edc.70.2023.02.07.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 00:49:57 -0800 (PST)
Date: Tue, 7 Feb 2023 09:49:55 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Forest Bond <forest@alittletooquiet.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <Y+IQs0sDfJ+rxsmq@combine-ThinkPad-S1-Yoga>
References: <Y9/xXHvOAwfqoDxn@combine-ThinkPad-S1-Yoga>
 <3cb45313-209a-8190-12f8-6a2d49e4173b@wanadoo.fr>
 <Y+A+HF1vDeRIqye5@combine-ThinkPad-S1-Yoga>
 <Y+DL3O5lcMyZ/aNR@kroah.com>
 <Y+H9BT8Am4Ik2ZDA@combine-ThinkPad-S1-Yoga>
 <Y+IJgxF52lpgk0RC@ubun2204.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+IJgxF52lpgk0RC@ubun2204.myguest.virtualbox.org>

On Tue, Feb 07, 2023 at 01:49:15PM +0530, Deepak R Varma wrote:
> On Tue, Feb 07, 2023 at 08:25:57AM +0100, Guru Mehar Rachaputi wrote:
> > On Mon, Feb 06, 2023 at 10:43:56AM +0100, Greg Kroah-Hartman wrote:
> > > On Mon, Feb 06, 2023 at 12:39:08AM +0100, Guru Mehar Rachaputi wrote:
> > > good luck!
> > > 
> > > greg k-h
> > 
> > Thanks for taking time.
> > 
> > If my understanding is correct, every version of the patch should
> > include all the patches/patchfiles and it should explain what happened in each
> > version(in decrement order) through a coverletter. Please correct me otherwise.
> 
> Hi Guru,
> Other than the cover letter, each individual patch should also include the patch
> version history in the descending order. If a specific patch(es) that is/are
> part of a patch-set, did not have any change, we should still increment its
> version and record "none" as the change in current version for such patches.
> 
> However, from the patch-set, any patches that are acked, do not need to be
> resent along with other patches that are still under revision. But do mentioned
> about such accepted/acked patches in the cover letter.
> 
> Hope this helps.
> 
> Thanks,
> deepak.
> 
> > 
> > I do refer "first patch submission" and above is my current
> > understanding.
> > 
> > -- 
> > Thanks & Regards,
> > Guru
> > 
> 
> 
Thanks for the info, deepak.
Is is possible for you to share some reference that is easy to
understand. It would be helpful.

-- 
Thanks & Regards,
Guru
