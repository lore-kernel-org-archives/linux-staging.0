Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D181FAE;
	Fri, 28 Oct 2022 09:53:33 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id v129so4635469vsb.3;
        Fri, 28 Oct 2022 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3cbP73NK3VqxMbuuPW7YHSHMiG90mZgEraKKVLg1W4c=;
        b=hkZK/MvkgdqjSO1l/UvJwJHNWSjUVI1cqm3jSwcg+iL8GvLt9/dVmMlh2mMmu8ouiZ
         qe403rhZBw3rwWZlCYphvoBCiE8oo3vJRLblnrnYQa24RtdCh1ajXiJcnmB6Kb2zX8Ht
         mRivBH25tITvo7Ls7SbnPeeryRKXc1Ds19usIcsI66OrO6j6zVBHAexAUDMbE4Mrd5wA
         PEYpx0xJPFGyLie5W5keu8a4FSh6pgvkroclg4LPbf1To4J+wCEh8x5DDck80BIWVO9y
         oVa0JV0YLgHY/ms7yEvmI8msdQY6N79+NVnQKQ1E835J4/3AiH3AXUwQpU2EBnkGyqQr
         srBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cbP73NK3VqxMbuuPW7YHSHMiG90mZgEraKKVLg1W4c=;
        b=1ftecSW7NPlCzIcCi8XGtMYct4KPvc7mmKXPD+YQpYH0X+Ihs2rWVp/xk6kzXMSpsQ
         I34pYd/cwuaykSJnT86MF3RFHm9Iq5nVPyWtfd0zHZrGjQ0xvaoCdx33ACb2f2Vb8ph7
         Udq4QaqHrHlI+XK3qDbAI29VCVGSRQKSCcNiJNNYfDPT78RHoQRdWhpq45zZ3iPTNSt9
         4Nr4B+gG7dNq5HMNrLIZtI4iqQmotJrFOMXoVUX499nNG9QSV2h6p+dDkHtMSIoqwJ6b
         adolgj5EWLrqmCNVcUClEcOOvAUhFI2mg4YOXjq+aRQdrRGwNFLfiYF5IM1pNxxrxL7g
         F1XA==
X-Gm-Message-State: ACrzQf3c3yyPZoB4NRNEZS1eyWuQLsj3F6eDumI+FH4OvzPnQvut+Ulg
	LZLpj9Gf+6K8P5BgeThlXQtSpO9NMDqbs9rY0Bw=
X-Google-Smtp-Source: AMsMyM4zJeL9wC1IjMA4Kc8Vd1g0zVAHzSJnFvf9uEZj1hfwKUDFgG02bFCAExx8LhkqLJRtvr6RFiFJKnYd68uORH8=
X-Received: by 2002:a67:c205:0:b0:3aa:1613:71fe with SMTP id
 i5-20020a67c205000000b003aa161371femr14680863vsj.57.1666950812704; Fri, 28
 Oct 2022 02:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221028051420.GA30073@rdm> <Y1tx8XjmR5QKV9lQ@kroah.com>
 <CAMk1CBOdgwnt3E7ByZMASv+O1WAmgKvsvMv5Gy9UNgg=kMBRJQ@mail.gmail.com> <Y1t2jffoLPxdOqJ3@kroah.com>
In-Reply-To: <Y1t2jffoLPxdOqJ3@kroah.com>
From: jovial umwari <umwarijovial@gmail.com>
Date: Fri, 28 Oct 2022 12:53:20 +0300
Message-ID: <CAMk1CBNe6RLybU3cFmp89iR4KrRoiMfGbsBO49WfOco3bDd5RA@mail.gmail.com>
Subject: Re: [PATCH] WARNING: Possible repeated word: 'very'
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thank you for the corrections
i am very sorry   for All these mistakes
i did not know

Best regards
Umwari Jovial

On Fri, 28 Oct 2022 at 09:27, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
> http://daringfireball.net/2007/07/on_top
>
> On Fri, Oct 28, 2022 at 09:13:14AM +0300, jovial umwari wrote:
> > Thank you
> > working on it now
> >
> > Best Regards
> > Umwari Jovial
>
> As you spell your name this way in emails, please use the same format
> for your signed-off-by lines in your patches.
>
> thanks,
>
> greg k-h
