Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EE06D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:28 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so309654wma.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=czsniBPSjwcUGxCWkGVlyBHAWB3MYgK1t+X524MoiAo=;
        b=CyEwiTS3Wc372QOZJfXNzQ0gxL3/bOanRaXo2+E8n5YD81UYgV/SQFdcp5zaER7QPz
         V7IaWdTD9I1pI+S1e51uTtlSJAGmrBv7vNhtoygHm7GPVJ67X38ZiWQK561+O2SogxkY
         41Zg+sB41fO1j8wYK7ADKxJL0yk0jHDZGM/ZjP+Na/gBj25Cprypu7bxSZkOdK8ULICb
         j6UPA+oVptcuNsDhHeB3CpQlUkw96v8B6AoMHEGFKC2LqI91Lb+8dnzUUGnYq7W2QeQ5
         CKn9wh64CPaS8lqd3ows3g180FnKF1GkPptfxQQkOuQbuiJgrT6EN682rEMRR/AgZmi+
         to9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=czsniBPSjwcUGxCWkGVlyBHAWB3MYgK1t+X524MoiAo=;
        b=I5+Ya4Theo7oS0mTyqe5qQLSaOt6hG8g9fw4HWJrLEZMoKjvYghYUHt2Ny+g5qrDHV
         f6aeohsjI+846cMAjMGBQ6yqTMzGehvPz2m6tYpYFhibMEzA2Wb+dPYEZUUi8ZmTuAsr
         OW5Sba81l3ex7f7I4BA7LwP8BGebflGgVkmGbFE7qMk/BUk3Dvt9E1ucKccwHwJoq+aq
         BXurm4bSeP3CgVgTPwwd9flX8CxH/MpxJ0ZtJH+5KsKfNeJ/6QG7DbkCgXP2ezBcm7AS
         jC72jEGzTYL1ROZMpr4XFi9wNEIGID19THXduYwWmF/3PRqbxuywmR7spAUqsSo5bbc0
         SC/A==
X-Gm-Message-State: AOAM531NFjj3V+dh9jMiz0+acWWYN4m80h61DairirkddnBV6/9qBy7u
	Uhib/0tj1w38E7HYLF4ATIw=
X-Google-Smtp-Source: ABdhPJxNRCNPqPehTurkv/wvbUChYRSMHJ2m8ie29BNkluhdmR2cCFm3GnzwESmH9Gf/kpLbRR+rgQ==
X-Received: by 2002:a1c:a90d:: with SMTP id s13mr16074639wme.132.1629129567256;
        Mon, 16 Aug 2021 08:59:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/23] staging: r8188eu: simplify multiplication in core/rtw_ioctl_set.c
Date: Mon, 16 Aug 2021 17:58:02 +0200
Message-Id: <20210816155818.24005-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify multiplication in core/rtw_ioctl_set.c. to improve readability
and clear a checkpatch issue.

CHECK: spaces preferred around that '/' (ctx:VxV)

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index edcac238076a..bb6bc6508255 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -825,7 +825,7 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 			i++;
 		}
 
-		max_rate = max_rate*10/2;
+		max_rate *= 5;
 	}
 
 	return max_rate;
-- 
2.32.0

