Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B722472
	for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 08:55:53 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id e20so28814336ljn.8
        for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=sCcLgRvJkR9iKJtE0TZM54SNoR36AJtTDJVyDy1EBvU=;
        b=jpo5cchSZeXcl0k7FRrU2Z0cqs7OHA5O58GKT3ZgQvzf4qGriyzgz+bB5IPBnGoEK4
         rUbXAgyne2TNrdMSxHjrukAMg+BkLrAgYeW3UnTFTRctd9rwH/SxohfRAVBGQVB3v0yU
         vFCB58ihDiFNPsSeGPkBUWGz6TVU/2iQU2X/GttHXVpuSITgqC4GDlbAloQNwVIe2Utj
         ySbL7KPiaPPZ08Q08NHUscGBqQHparjyJsaF0BOJZfyb+S0TCNZUywO8s65141u/8BmU
         ToH5fASJwe7ONSVsmbPJeIMpyex6lblpy5zCR374Znx8sTJcsbvM4NTaju9jjgv5xyzF
         B9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=sCcLgRvJkR9iKJtE0TZM54SNoR36AJtTDJVyDy1EBvU=;
        b=Y+1nxHDSWD/YUm72ryxRAR4ni+mcu90LuRyeReC1gbObxjGocLoO2JOCRrCGubna2n
         HEdODrI6SO4ET5rzElFzPFMUMRBzcA9s8I94w8PvDiw1v2H3i29txaUuradgyRAwIEVq
         gMioa2Htsl4e0GBow1trOGH0i0jcVQZ02BmI3vDrR/zksLcX3wCwGzjW1eQOe0G6ofof
         +N1HCPg1r9n3QXlMV2xgJbT/2MT8uV7EoYKDYH2RFPnOQZRWpshq5K+B0pTfkrqqeQKk
         CBMPYmTEp3AGPz8LkBAC/lv3qYSRIoTPCnFM5F6eE7uwxc88kPFJ4HSNCgSPKYZ+QDeD
         VRAQ==
X-Gm-Message-State: AOAM532qrfqgJcYewwkets9gjnKrS8fpIsj8QlXDTRUwJvPvFZWPAhz3
	aGUrqTPWj8HpIZzoNomGG1Y=
X-Google-Smtp-Source: ABdhPJzA5YMCxqv8RW16fmfOS/+n2kCTf5c6JnAcc+y7+DRGvciQPj/CDujwL1iiJSMUWdyxa8DAmw==
X-Received: by 2002:a2e:b80e:: with SMTP id u14mr3289392ljo.204.1626166551528;
        Tue, 13 Jul 2021 01:55:51 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.115])
        by smtp.gmail.com with ESMTPSA id z13sm1516882lfb.40.2021.07.13.01.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 01:55:51 -0700 (PDT)
Date: Tue, 13 Jul 2021 11:55:46 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: syzbot <syzbot+5872a520e0ce0a7c7230@syzkaller.appspotmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
 gregkh@linuxfoundation.org, hridayhegde1999@gmail.com,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 rkovhaev@gmail.com, straube.linux@gmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] KASAN: use-after-free Read in r871xu_dev_remove
Message-ID: <20210713115546.34c99ea8@gmail.com>
In-Reply-To: <00000000000087b4c305c6f8a243@google.com>
References: <00000000000087b4c305c6f8a243@google.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/1xeXNtIU994YuIz1.xGs_4k"

--MP_/1xeXNtIU994YuIz1.xGs_4k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, 12 Jul 2021 20:14:24 -0700
syzbot <syzbot+5872a520e0ce0a7c7230@syzkaller.appspotmail.com> wrote:

> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    92510a7f Add linux-next specific files for 20210709
> git tree:       linux-next
> console output:
> https://syzkaller.appspot.com/x/log.txt?x=16c50180300000 kernel
> config:  https://syzkaller.appspot.com/x/.config?x=505de2716f052686
> dashboard link:
> https://syzkaller.appspot.com/bug?extid=5872a520e0ce0a7c7230 syz
> repro:
> https://syzkaller.appspot.com/x/repro.syz?x=1639a73c300000 C
> reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15fcd5e4300000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the
> commit: Reported-by:
> syzbot+5872a520e0ce0a7c7230@syzkaller.appspotmail.com
> 

Hmm, bisection is wrong this time. It should be
e02a3b945816 ("staging: rtl8712: fix memory leak in rtl871x_load_fw_cb")

#syz test:
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master


I guess, this should work


With regards,
Pavel Skripkin

--MP_/1xeXNtIU994YuIz1.xGs_4k
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-staging-rtl8712-fix-UAF-in-r871xu_dev_remove.patch

From 954ffa9067907a5f6d4d6d2b72a98b8773cac11e Mon Sep 17 00:00:00 2001
From: Pavel Skripkin <paskripkin@gmail.com>
Date: Tue, 13 Jul 2021 11:52:17 +0300
Subject: [PATCH] staging: rtl8712: fix UAF in r871xu_dev_remove

/* .... */

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/rtl8712/hal_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8712/hal_init.c b/drivers/staging/rtl8712/hal_init.c
index 22974277afa0..c06d31784cd4 100644
--- a/drivers/staging/rtl8712/hal_init.c
+++ b/drivers/staging/rtl8712/hal_init.c
@@ -43,6 +43,7 @@ static void rtl871x_load_fw_cb(const struct firmware *firmware, void *context)
 		r8712_free_drv_sw(adapter);
 		adapter->dvobj_deinit(adapter);
 		complete(&adapter->rtl8712_fw_ready);
+		shedule();				/* to not trigger UAF in wait_for_completion() */
 		free_netdev(adapter->pnetdev);
 		return;
 	}
-- 
2.32.0


--MP_/1xeXNtIU994YuIz1.xGs_4k--
