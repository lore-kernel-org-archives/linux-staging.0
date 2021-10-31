Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74968
	for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 18:51:10 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id e65so15233288pgc.5
        for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 11:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=LbOPgXUy+8K10GTePYW5RJJdGzLLV+FgjjdIr6/5xjQ=;
        b=ekQrVjnFOzW517qgV1OkKXojdFZEzOGkYUB4Gs2vCL2VPStZMDZ3iOhPdg5tgkKz/F
         Ohd93hnfsTh+jFngrZweEJUlmXjRQhndlOomveutXGdi19b/+qIxAV/Y9eITzTNk91VJ
         eymE64euA7nPR6p7QNo635RhtcpZ8Nu8glhZXM10mr3MzPbqrFVBx4pUrP53tiE13T2x
         c2yzXFjRjAX8IbnalZLXQVagbVBJfjAWAxBvqzYdgE15SfbDBbOsH6RucqhqiCO9ulPG
         +ATVLqGS3oJUyKFsTLgsl9HsVvyVjoN0yld/UccSqWrC0ZABcj5w0WG6zUIpUOEH76sN
         Lh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=LbOPgXUy+8K10GTePYW5RJJdGzLLV+FgjjdIr6/5xjQ=;
        b=a0iyS0GXjVMaWJOZX4IaXI/PPbFuDbM+AU30jtwGokRUFopwWnlm3viQv/+uBcK73a
         FgyfhZsfP6dbRea6MsQd7cSRu/ssrkWk7kWCSXpaCvC/13IUoyvL5r1ESv9CAAWsN1xz
         KVLk2NpRdlyxNTHc5V+vad8NM5cT+/ndeLPxQJBbuk5M5HgJI3lzU0MRt87CgAZb+0jU
         l+EehhxQgK3Z1wDjbdll49gRv9GTIbc+6EXBm9p1MFS+S2SjFtZYxcL8D+7B/hTXOWum
         mkGJ9kCoqIKhcfnCXuNAzb+LFZoR1oWeltaMVmxDUFmDOZrz5iKpbRlXxPu7LMVM+AhM
         HHnQ==
X-Gm-Message-State: AOAM533Dgv8QNFu6Iwy3I+ULQXg4pU9SLgGfQp/WcfY6L+X4LekQOD7K
	QVHfn5ACJ3vz++64A4CZN8c=
X-Google-Smtp-Source: ABdhPJxXrh5TZbwvJi0fdtXIUGAAX/T1jZeDtJHfJePYkeHV8g65ocAnk/IaznouNQbm+LfKqnt48Q==
X-Received: by 2002:a63:88c8:: with SMTP id l191mr6919960pgd.369.1635706270243;
        Sun, 31 Oct 2021 11:51:10 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.88.136])
        by smtp.gmail.com with ESMTPSA id f10sm13037640pfe.82.2021.10.31.11.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 11:51:09 -0700 (PDT)
Date: Mon, 1 Nov 2021 00:21:03 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: hal: break after the return not useful
Message-ID: <YX7ll4SbJ8oM7uef@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the break after the return statement. As function is return
break will never execute.

issue detected by checkpatch.pl

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
index 0fd11aca7ac7..c88e10417100 100644
--- a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
@@ -83,7 +83,6 @@ u8 HalPwrSeqCmdParsing(struct adapter *padapter, u8 cut_vers, u8 fab_vers,
 			case PWR_CMD_END:
 				/*  When this command is parsed, end the process */
 				return true;
-				break;
 			default:
 				break;
 			}
--
2.33.0

