Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3AC20F2
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:09:22 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-64d2a613ec4so892074b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684490962; x=1687082962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bzq3Pqk8pZIS4OBKRNMcHxRAHqoQcIGGMgWTxxeCr8o=;
        b=mN/KYSkjwe4oBUPBj056lpeRHMayZYGNPkMtc0EGvqsj46UqpJPSFQCnHHYK7th6a5
         jK7/CP+NV3QVLIiGceugKCiKPlNIEOYWwNgmIlsfr/AKYvOG//Tf1tmkdqcaxE3Shk8y
         gEnLyIXD2EE/mQ5GBd8M50YOOVrWYrd+2+VMwbjIDO/PktxR/3X8vX0gtmJB9kGps8t9
         4ENar8i0NKaPVkorRtNj+nC/fgJwVtNxGa54QdCQeVwlbrNQ/8Xpv6WSYpia4XniT+TZ
         fEgTcsOzQg+sn1AVTXW4k2p2uxopwB/8CcJxyZmXbOR+etMHNebL6eYQTlaTE2OUXA6C
         P5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684490962; x=1687082962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bzq3Pqk8pZIS4OBKRNMcHxRAHqoQcIGGMgWTxxeCr8o=;
        b=J6GJq4KqtZnpJREUQRWUeYgC/8WX2FhABfClOGgsur1PxozFR5FbocfslOAtTLpnEa
         To0dHCe2P3BERUQLS4UShe69ZVbAboyJnM1NJZ2etPuJypgYRU1cRGAlzQ4phHF/VENG
         or1RY6ZPqdBIrczOwi2MMPN3ddrdfJM6w38+vPPNmNGzphOTL5hLltptkjV4e0Vr0aay
         TiekkDTIY4mKcibqGi05kT7rK13BA430wThyInODm7CysU5RldxBrgSUqvK8xca5JCx7
         gQHGmDwXFe8yv6BZPvUitG8S4DBsG9Lb3vCOABgT5TF3/sUIF9ISl4x/9BUHNvP26HJY
         GpcA==
X-Gm-Message-State: AC+VfDxw/qMyXBehaZbnX04zVBhFVbpLhyYcsA8QpFeYGwOIwfQpU2H+
	w0W+iRyqKfsTDNoe8nhN+DM=
X-Google-Smtp-Source: ACHHUZ5ftD6QXjy0PpqJoH+opC2XVe0mXm7OhPMOt5ELaq+FalOSQQeCpHWEzyQDp8RxlxMD4P0paA==
X-Received: by 2002:a05:6a00:1145:b0:648:ebb2:3d6 with SMTP id b5-20020a056a00114500b00648ebb203d6mr2410811pfm.26.1684490961768;
        Fri, 19 May 2023 03:09:21 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:92bc:26c4:ce02:816b])
        by smtp.gmail.com with ESMTPSA id g10-20020aa7874a000000b006439ad979cbsm2687554pfo.152.2023.05.19.03.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:09:21 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH v2] Staging: rts5208: rtsx: Moved else statement to same line with else if
Date: Fri, 19 May 2023 15:38:58 +0530
Message-Id: <20230519100858.26508-2-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519100858.26508-1-kartikey406@gmail.com>
References: <20230519100858.26508-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moved else statement to same line with else if,
this warning was given by checkpatch.pl

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

...
Changes in V2:
	- Moved else to the same line with else if
        - Moved comment on else statement to inside of it
---
 drivers/staging/rts5208/rtsx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 2284a96abcff..47dacef0aaf8 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -399,10 +399,8 @@ static int rtsx_control_thread(void *__dev)
 				chip->srb->device->id,
 				(u8)chip->srb->device->lun);
 			chip->srb->result = DID_BAD_TARGET << 16;
-		}
-
-		/* we've got a command, let's do it! */
-		else {
+		} else {
+			/* we've got a command, let's do it! */
 			scsi_show_command(chip);
 			rtsx_invoke_transport(chip->srb, chip);
 		}
-- 
2.25.1

