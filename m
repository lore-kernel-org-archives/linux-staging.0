Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D192CA3
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 21:50:49 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v6so13467441wra.8
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 13:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Ep42MnLkFZlrJ74AAV9uWHzBCOpHXZvB1eY1I6VZcA=;
        b=eiJW1xFSgYimTpYHbuZMyHZkNTPU8Swy4orSrOqottjTnPVlC3u96iSHevzBZ4K6Oy
         80fk7UhPLDPH9VyEeh7+HRiGRTL37Xxs8ZTrTct25l4CdUK+9MKufVQCYDN8vYk2hMAc
         8AiTu4P1gCsv4w55Dj/ZteE2FQ7MTseIDMcEN/Ipjj7paQBnfc6AB5Au0hLnbDhIa61c
         jFRNC5x7mCcy6l2FdhSNgV4YOrokSaQUYTwX0a2qSt9+jeTxAVWgSgTTalr4o3syiYkO
         NpuROKuTlujJevJxqewO08IwI+PsEaE7pT31tazccsIZr2zDGcrEZRB+Nxeqn5ifWgXb
         /h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Ep42MnLkFZlrJ74AAV9uWHzBCOpHXZvB1eY1I6VZcA=;
        b=LAjhug7DutQeZgX0ppXGfvF5h4Vdm+7D1hg5vG+whA+EU7ZN1baFRrRUkiGGZHgGFN
         26Gu4dvSpr7Ggu/DuT+FAvDZYoVo6+e5+qkjDgKWIZIvPM1HBILPz1w6l04u/CfVmD0m
         y1tOjPAsNXGZpBshOVLRTRDj9QCX8l1hvf8fLFcPIXNKDWnwqVxYO7RdOiuA1Ytlu4/2
         7QdzDZygmPeURp/VO5CDZu/zCrdhGezaIA+a/8DxJfZif/4g+j25oaOjqPKYiguHjWiM
         F8FsKKPnQmUZJSXyA/2cW+AhBtxb8OvIZtIvzX7KByJ5/UwLHR+I1lJ/z12FaqJ+ntmk
         F4dw==
X-Gm-Message-State: AOAM533v2ahtypnwgeXDWy1cWKPqY/EvQF8tMo0j9bj9wcWslzJXY1si
	EeSV+sDMI81TCtO6XV2hnho=
X-Google-Smtp-Source: ABdhPJzQZNvgEuxGSnAUVjNxYEivHw1oWGioiYTl+nKKA9jiH8QB6Zjdyfw+kt6JOKdvHq7JXFAkKQ==
X-Received: by 2002:a05:6000:12c3:: with SMTP id l3mr2893987wrx.638.1641592248395;
        Fri, 07 Jan 2022 13:50:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id k14sm1729161wrn.59.2022.01.07.13.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 13:50:48 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/6] staging: r8188eu: remove HW_VAR_EFUSE_BYTES from GetHwReg8188EU()
Date: Fri,  7 Jan 2022 22:50:31 +0100
Message-Id: <20220107215033.12257-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107215033.12257-1-straube.linux@gmail.com>
References: <20220107215033.12257-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GetHwReg8188EU() is never called with HW_VAR_EFUSE_BYTES. Remove that
case from the function.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 33523ca90ee5..c1129c83ebf7 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1614,9 +1614,6 @@ void GetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_EFUSE_BYTES: /*  To get EFUE total used bytes, added by Roger, 2008.12.22. */
-		*((u16 *)(val)) = haldata->EfuseUsedBytes;
-		break;
 	case HW_VAR_APFM_ON_MAC:
 		*val = haldata->bMacPwrCtrlOn;
 		break;
-- 
2.34.1

