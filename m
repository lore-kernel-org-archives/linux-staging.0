Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC2D51C
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 18:08:38 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id x7so17766366qtv.13
        for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 10:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mNtUwk8pZ+4ME/1vifRLekNO13Wg5Zu56Lt21b5zZ/E=;
        b=NUkTrZoP7W+dbV5M8TQ8QZ6EJ7AeGCEJe1YDCK4M3eOtriQU0VMF0jrTQfZKZ04nX3
         tObhhl6SQ2s5vYRuVz0gifyjTCXvFFqjWl+foeDKQjIJ1LSYJjYBhUE1xbKZtrcLqo2Z
         WLSR545diQKAiZhOEwCRqYEnywadjsPloZrSJW1WjO9wH7ptol5kfIBGQT2J6Z+oPcUq
         e5bKJNMfyBEPGKCPfLlc5LXIRFHEPjarEbVgrNua0YSVPStVGuCH2Ws6+4vRqOqHIOeR
         oKWk5W/o7VnUE7D8rQpa5OwRaV6ErauCSQr0Tq2X2N6redlnD2o1Cs9bxxQz1s0511XO
         CYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNtUwk8pZ+4ME/1vifRLekNO13Wg5Zu56Lt21b5zZ/E=;
        b=4giogK8u8lo1R9Mha0ASR4KrgfdlTe31ME0wQsBz1jMH0ZhzZ1Rnu1wEfkFTDss/Rs
         tk8cHzj7TK9XZ+4ojZqPo3O6WNMrzTiIQSsNTuHz8iFsI0OjwDUWa78IP4PfINVLI6WK
         2awdwtJAMCyAyDKgewoYjz0eiR4d/5acX5q/PVm+vT8Qb8vdat9cwSSSHWqjRdfbN7yO
         g5FXl7smgIwugdbbXmycxs8TYFu5z0ujpSBN0DA7HnVZn/gfofxojW/Qy/17da5Lw0YA
         Xhxnrd/tPfaIHJvt87e6W7ybBLL90jYXbtfl73gi28CCRtZGiDN7oeVIHhF/8xCUrAIo
         HJSw==
X-Gm-Message-State: AFqh2kpg108LkBBtfsbkXHGjZ4YE0S5SPLtB+ijR7NJ10+q1WDGGHv2N
	Kr3jvq2b4xFcEJG5kEjs/t4VhgbLVPwfXAVS4kM=
X-Google-Smtp-Source: AMrXdXvNpef78aF7A4F+6Aj+fH25NTbcazp1VYsDIP18+HyLQeo70AF3aJANwdtMB6J/E6tCNsz6V29gc0SCtxWin7k=
X-Received: by 2002:a05:622a:5c8c:b0:3b6:30c5:6d26 with SMTP id
 ge12-20020a05622a5c8c00b003b630c56d26mr188562qtb.429.1673978917903; Tue, 17
 Jan 2023 10:08:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y8bARLuFubMVILIN@smile.fi.intel.com> <20230117161659.31232-1-bpappas@pappasbrent.com>
In-Reply-To: <20230117161659.31232-1-bpappas@pappasbrent.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jan 2023 20:08:01 +0200
Message-ID: <CAHp75VcxaSXeMNmkPoMnA+zjp+JWmHp5aE+2yPhXaqxMC6QWEQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: pci: Replace bytes macros with functions
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: andy@kernel.org, ailus@linux.intel.com, error27@gmail.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 6:17 PM Brent Pappas <bpappas@pappasbrent.com> wrote:
>
> Thank you for the advice Andy.
> I took a look in overflow.h and found the size_mul function, I assume this
> is what I should be using to prevent accidental overflow.
> I also removed the inline keyword from the function definitions because
> Dan (error27@gmail.com) recommended that I do so in reply to an earlier
> patch I submitted.

Now you need to properly form a commit message. What you have done
above is good for the comment (goes near to changelog).

...

> +static size_t fpntbl_bytes(const struct ia_css_binary *binary)
> +{
> +       return size_mul(sizeof(char),
> +                       size_mul(binary->in_frame_info.res.height,
> +                                binary->in_frame_info.padded_width));

I recommend using array_size() and array3_size() rather than open coding them.

> +}

...

> +       return size_mul(sizeof(unsigned short),

> +                               size_mul(binary->sctbl_height,
> +                                        size_mul(binary->sctbl_aligned_width_per_color,
> +                                                 IA_CSS_SC_NUM_COLORS)));

array3_size()

and so on.

-- 
With Best Regards,
Andy Shevchenko
