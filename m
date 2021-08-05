Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B962170
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 11:47:09 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id qk33so9029674ejc.12
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 04:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qBX3Xccp6bI54eSUznvP+6mMefHCK9TZwZhPwT50a08=;
        b=lTrn5cZNoWXqzAgGOwj5Ih69j5jyWhRh9SlLjGef3DYLtYYBKx4o4Wm5ZBnuHXfK4M
         zp7cHfSB7Xsehk15UR36MVM/Oo26W8d3pYNxu2ivajL8gILjIjc94J+L3XzcUaerMaJA
         YUzsBMifPy0Ah0b6qgiSVaMSEmgYzA+J2ciFOsogudhUKFgXSkiraIV8JiXifUGsSz5I
         efof0eYyge0emxB8J/bwPuMU0s3oJMXCL0YDAH+MVjzQhy+AwEy4u0goH5t9n29MJobN
         Hq3ItNV2cd+2mkwQ5kOqSSqASGdcVWMAwhQRI06F+3EABE1AYSxE/uU8hE5w2c4OkbLl
         JkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qBX3Xccp6bI54eSUznvP+6mMefHCK9TZwZhPwT50a08=;
        b=fr2Scx6O8DU6Zz3TmjJ+W5Ef8YpOb+LUDv/rLAcn+Y3knaRnl8hLjZC0mCEQAOomt2
         I5t1AJyzMrq1/FU0Mgk3nuJbWWYvguRMSjluSkTgFJf52mJTzsNzGQx4i4+uEdok1CLH
         Q2QCC/S9pfFSVtuaUQ2HS2uJpvkR+ip8F51PhSllxuY1wYsUGs/yXv0J4r6U/xRlEHCN
         Q/8utP/lINx+9WrilkKF2p5pp3c7a0eTXLGuVoQx3FkP3+iVw/vbU8kQZvVK65atN4lF
         z+r3nvMOrbH28XlTdIF+loBPAHv3G/NfDitUX/+90z453WDpaP+en7hNe0YjfAf7kwgK
         al6A==
X-Gm-Message-State: AOAM533cFwytUpHIcgXteyhelIvJQjO5Es/L+/H020fdwzvtLgr6NcJw
	dZKjcqha0mkXOiMWhPDjZqY=
X-Google-Smtp-Source: ABdhPJypvf/JPpUIIfitGvd/jw8HyAKKFLrzW6oH2/GdeZY6KY0SHKIkBSz61OkRgPcNfYuemUn/3g==
X-Received: by 2002:a17:906:24c3:: with SMTP id f3mr4397984ejb.145.1628164027969;
        Thu, 05 Aug 2021 04:47:07 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id o23sm2179103eds.75.2021.08.05.04.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 04:47:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: r8188eu: core: Remove rtw_mfree_all_stainfo()
Date: Thu, 05 Aug 2021 13:47:06 +0200
Message-ID: <4588980.OG3HjkdD0c@localhost.localdomain>
In-Reply-To: <406c6f84-a2f6-1a0e-3a52-9406df41973c@lwfinger.net>
References: <20210802005517.12815-1-fmdefrancesco@gmail.com> <CAP71bdUDEX=B6Km9wZO1AyHpVzqqkGNw6xNvspBz3qUABSKMEQ@mail.gmail.com> <406c6f84-a2f6-1a0e-3a52-9406df41973c@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, August 4, 2021 8:10:37 PM CEST Larry Finger wrote:
> On 8/4/21 10:09 AM, Larry Finger wrote:
> 
> []
>
> After looking at the original code for several other drivers, routine
> rtw_mfree_stainfo() just ends up calling a couple of routines that free a
> spinlock. That operation for Windows and FreeBSD is not trivial, but for 
Linux,
> the routine does nothing. Thus, despite its name, rtw_mfree_stainfo() does 
not
> free anything, and it can be deleted.
> 
> The original patch is
> 
> Acked-by: Larry Finger <Larry.Finger@lwfinger.net>
> 
> Larry

Larry, 

Thanks for looking at that routine and acking my patch,

Fabio



