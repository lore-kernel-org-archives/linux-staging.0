Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E3070
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:30 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id i18so5317725wrm.5
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omO9jbU544MlX2hw1Wy7qunDkzreILEkRU9p4/5TxAg=;
        b=dBXjzkb0tN2RvolgWXitSUBe/HE9FrHZuPVAYafly2kXwy6cciOn3qRvetMvb5HKfS
         jDs3bQXQC1d7nCMKK4kAaXFF2iCC/s94mZRkXsq0uYpHD1KyyY/5ZhAfVUlP3raOPz1U
         D7Bf+CMcedfxVUCAgNJJcxH7jO2VyhG4nUV8bNzJuaZ2bwcBrUSFSre344BIPJLhY95e
         irauH7WJm/D+9wtu9A7RwT0zV6yUtYZhYyXXKxEqa/l8jZmyi0VFb1LIwRluU/EJsz93
         IUscAcYZp7tVrEQ7mGaMSrLv8fUeKsFBXG5yhCE7mtpbfsZeXsJWps+c5c8v7U70foJ+
         q4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omO9jbU544MlX2hw1Wy7qunDkzreILEkRU9p4/5TxAg=;
        b=UxJ969U2PYJo2vKCt+UfPlnCmp90Gjpr7WDYXysqLuwNejs6WFT/+Dqz2u6/bAmAM5
         UsUJocxa1kKw7QeBbgSZcJVYjCuXtZROV2ZWh8ybR9X6MrVuVbw0uLtETqmmIcYSyotD
         /BiWdsd5QIGYJuFDYW7T8/cgMX2yBGghYXEb7IJ6TWoHIKod0x3YzvFyOUlUHHbXfZiS
         fJJYRdpQszRmpvFzYTXeaBcYFVkhFSB1yqGetHsDBo2I5aKoTX8yx6nGoN6FGo6luPbj
         LAyJJDytPlQKErbJEM9Gz/RSHWW8iq5wY6AkuwxWk9CAtrvedrdx/xBeQACT2J+QbZFZ
         mPKg==
X-Gm-Message-State: AOAM532CUwM2hKh46gwsXREZrA7WYsJemydklSW1VWWHowZIizCQ7Gig
	YnSLPJoks0t487AeMnoT7J8=
X-Google-Smtp-Source: ABdhPJzRBH5QByWqTC7wvVWLfP9UmPmgTRQPuoinbBjuJIsgfXBPi5EkxQoGY5t3YlQnnvBPT8oRFQ==
X-Received: by 2002:a5d:5051:: with SMTP id h17mr24462110wrt.80.1617545428719;
        Sun, 04 Apr 2021 07:10:28 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id d123sm570106wmd.26.2021.04.04.07.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:28 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 23/30] staging: rtl8723bs: fix comparison in if condition in core/rtw_recv.c
Date: Sun,  4 Apr 2021 16:09:39 +0200
Message-Id: <4b363edbc2da36cb3c63edbcd43e3285754768c9.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit checkpatch issue:

CHECK: Using comparison to false is error prone
27: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:381:
+				if (psecuritypriv->
			bcheck_grpkey == false &&

and fix the same issue in second comparison to true
inside the same if condition
IS_MCAST(prxattrib->ra) == true
			^^^^^^^
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index bf53695f9f7d..eac663119290 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -378,8 +378,8 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 			} else {
 				/* mic checked ok */
-				if (psecuritypriv->bcheck_grpkey == false &&
-				    IS_MCAST(prxattrib->ra) == true)
+				if (!psecuritypriv->bcheck_grpkey &&
+				    IS_MCAST(prxattrib->ra))
 					psecuritypriv->bcheck_grpkey = true;
 			}
 		}
-- 
2.20.1

