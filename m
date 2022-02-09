Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900072C80
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 16:37:50 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id 9so2332686pfx.12
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 08:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i7SfWIYcMKFCx5mR3sW9x5b00I6aXavnSx2tCKm9abk=;
        b=nQKoxqasnjZrN00QaFeMliXHfvnZcy+tTEFc7C7RUnzM9Se5ggSjPr77OEFn1QeXad
         wKtutXnXHMQxNmQHOSdfYOT3dHRlseIvup5D7jMbxQZ3UuK28+AuvUOET57dgoLrp5qs
         gdiGoXlPg4YzaUmaM3seCzbJMnKQ7Sqy4aGdRp1Z/smh1HTVrlYH18nS8zIrnPfw+w6F
         s9Q4eDU977sVCszrOol9N5ge+ZYJrWR00vAIMkdqrIIEZ1MRGrRNcrnjJPElyXZ5h32v
         +Kuwxww0eb5pyXcu7uFzCPjpgup1wMpXPHTomX91ibbCuXMnKeBM7gP6Z0CjxT08UaVX
         er1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i7SfWIYcMKFCx5mR3sW9x5b00I6aXavnSx2tCKm9abk=;
        b=Hf2IqRfaLeJ433fEE/NOHbcTnvX69j7C9gcat9d0FJgblMfkmk2lvthsRNNntu84jr
         cBEBj9UZg76yKB+MY5WwkuEA9Y9eJb1wXv9YMUKRFFCCR7m0M7Hym6Fh6b4JRyW425XA
         QDSjNF/+e6jMymS5LmJoAUiHU6w39HJte2Y8p5WSQxG3ERUoPmBSCv82bd53tFsbsF8P
         EBqEuXd9c2i3jiUd7Ta77/HD6Im6Si4rqbcpf+cB/jiBGfb0IZehh4h5OR07QP2CFR5z
         bP6leTmgXJFdXWpK6EP7mCAU6u8tZu3WapNCC8aKRTN0UxqjV8iYGVaV0hAf2n+mFApB
         2p3w==
X-Gm-Message-State: AOAM531tBgt48heKK6Myaqcze7khVYBAq5eU1argk/AY2tRXBKR4p15Q
	MIWYARNCU/SYhuySvplimqMJzl1RfmU=
X-Google-Smtp-Source: ABdhPJybq5FBQ8lAAs34GkEFcjdMxEWedEpVGe/LtAQ4W5ca34VdnBYoMROqz/BXp1m1e6piMlCftw==
X-Received: by 2002:a63:67c2:: with SMTP id b185mr2580013pgc.38.1644424670155;
        Wed, 09 Feb 2022 08:37:50 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id kb18sm7840199pjb.30.2022.02.09.08.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:37:49 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 7/9] staging: r8188eu: remove unused argument in on_action_public_default
Date: Wed,  9 Feb 2022 22:06:05 +0530
Message-Id: <01c8fd82c21ae96773c9099a2cee3c3fd29c1054.1644422181.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644422181.git.abdun.nihaal@gmail.com>
References: <cover.1644422181.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function argument action is not used in on_action_public_default.
Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 7fabb5b11aac..27bfb43f306e 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -4044,7 +4044,7 @@ static unsigned int on_action_public_vendor(struct recv_frame *precv_frame)
 	return ret;
 }
 
-static unsigned int on_action_public_default(struct recv_frame *precv_frame, u8 action)
+static unsigned int on_action_public_default(struct recv_frame *precv_frame)
 {
 	unsigned int ret = _FAIL;
 	u8 *pframe = precv_frame->rx_data;
@@ -4083,7 +4083,7 @@ unsigned int on_action_public(struct adapter *padapter, struct recv_frame *precv
 		ret = on_action_public_vendor(precv_frame);
 		break;
 	default:
-		ret = on_action_public_default(precv_frame, action);
+		ret = on_action_public_default(precv_frame);
 		break;
 	}
 
-- 
2.34.1

