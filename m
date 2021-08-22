Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50593FC3
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 16:24:24 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id s25so9546347edw.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 09:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5TsWkpCa9oK0Y3XatOG1ojrJ9dXPyqHirLcQPTkgsZ4=;
        b=H8+jNCTiRlPQ0Eky1gTfskoYJCB2AEUsT8c3Jhv7gzfrhn5CnK7Ed4GwEWbnzxg6nc
         CGi2Jh4MuWU75LF7w65eIF3jXHh59OvAGuTQQIovfT7Gh6bZBJHfA/t/BJ5Xqzf4Jch8
         wSg3vi6azb1onEOiCP9wlYkG8bxVDPJEy0dWfGMhomW5tGzWI29MkCL+HQ2ojzPn2voz
         I+Yw82BgBnn1BL/lYtHJnZ9KRBHXB5CRw8kJCb0iXlyToTrSyKBXJtAdbwJKnPXQQDaO
         wj7tq5vRPICYJ4d1JBhqutD3c6iDGXPa3kYt8gkY4iWD8KF3lY4B2Z3T8iWqcKa6/rya
         FnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5TsWkpCa9oK0Y3XatOG1ojrJ9dXPyqHirLcQPTkgsZ4=;
        b=DCuPRSLvw//FJIEEexZIYvAPDJLdQBSKiW60RxVkGX1KtWl8il1Yzzv2ZYrm2CIQmP
         wta6eknO6HgNWrkKalRcDK4s75788QNZDS/gHAXfq0ixCtEQDkwpcb10Qf1ejN/EFoCX
         yiHJlcrAWCXFnZXVjLNNU1dY+saSsv6ZIYcYOUi1jh8mGOCFAVKuFHgh6fkYqy84TuI5
         5kii2yQNiyHZXeUvsypZTOmL7VPDX6qSeqUytaTo0lsvVzC/WnExDSYkT7LB8fydlU4I
         IaSBKILR8WWWTkBpzNKeWYMOIz8gm+v3Ewk1vdPWj4Djf8Z4Ztv/yU05PV6CmCOc8vSQ
         bpIw==
X-Gm-Message-State: AOAM531797aBaeOYkakqK9RVrMnL6OEJAoQ6Kt5IsAEYATMKdoaITwbl
	uv0eDchWBOKyWLojus658Aw=
X-Google-Smtp-Source: ABdhPJwU0xskbCrPLwjN+G10gF9G2qoXqQzWCKWBoZ/HKaKRzgsZUoup84dCZ3zUYbv3NNd5R2ZI1g==
X-Received: by 2002:a05:6402:270a:: with SMTP id y10mr32920074edd.385.1629649463180;
        Sun, 22 Aug 2021 09:24:23 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id p5sm3532142eju.30.2021.08.22.09.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 09:24:22 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: core: remove condition with no effect
Date: Sun, 22 Aug 2021 18:24:21 +0200
Message-ID: <18734228.Nv2I6EOGHm@localhost.localdomain>
In-Reply-To: <CAA=Fs0mu4m04_Be4-f=W+=_hhGn5oJ2q=KOmZdRrMyGhMgqc-Q@mail.gmail.com>
References: <YSFgrLUfXzgcT6k4@user> <1821445.fzUCeO1EU3@localhost.localdomain> <CAA=Fs0mu4m04_Be4-f=W+=_hhGn5oJ2q=KOmZdRrMyGhMgqc-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Sunday, August 22, 2021 4:58:10 PM CEST Phillip Potter wrote:
> Dear Fabio,
> 
> An Acked-by merely signals acknowledgement of the patch, and that is
> looks OK to the person offering the tag. Please see the following
> quote from the kernel.org documentation:
> "Acked-by: is not as formal as Signed-off-by:. It is a record that the
> acker has at least reviewed the patch and has indicated acceptance."
> It is not, to my knowledge, a commitment from the reviewer that the
> patch applies to the given tree at that precise moment in time.

Dear Philip,

I didn't mean to be harsh with you, I apologize if this is the message 
I conveyed. Really!

> I reviewed the patch, and indicated my acceptance - the content of the
> patch is fine. Whilst I will often make an effort to merge + build
> test many patches, I will not do this with all of them, I simply don't
> have the time due to other commitments. You can be assured that if I
> have offered this tag I have at least read the patch and it looks
> correct to me.

Now it is clearer to me what acking means. I've given only a handful of
acks because I thought I should also check if they applied and if they
build. It takes time. Now I understand it is not required. Thanks.
 
> Particularly with a driver as in flux as this one, there are going to
> be many merge conflicts. Advice such as this to me is not particularly
> helpful, as I can promise you I'm trying :-)

Please, don't ever think I'm not more than sure that you give a lot
of your _unpaid_ time to the kernel and I thank you very much
I know what it means, because I too have other commitments :-)

Cheers,

Fabio 

> Regards,
> Phil
> 




