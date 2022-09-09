Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18A3808
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 12:18:36 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id e18so2239667edj.3
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 05:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Tcj9zdEuhhwwc+19W7KyuMTeuqCemH8yB/Q5e9nu8aA=;
        b=QJxqTxB//D87aPuiZfpZ5VujODmr6Zn7XTUdwOc9fB7P++LBDU6mZ5MyPB3filboiV
         3QdtP/VQuoOT6v1Amv1a4hZ1jKAfJlN/9HqbXqmHT41NJpE30/3fubB7OH+lNLRM4z2B
         nQzKDW23vFo83M4VlpOExEGMPpLjeefE0pGi0G77AGb5GnW2WkMbFh6+TXebQ9ugKTvi
         NWhYU1FnmKwrFWOPZW7GNwol2T0ILIeBQsEDYMGFxMxZ6wPT0soA/hjuwzBNgCOztft4
         TqZ1qaaDz72BmobxjK+vp0+LaU/FSRf5OZVLYlCpSMiXZ0fLzWs14bctFAP8EU9TzfW+
         n0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Tcj9zdEuhhwwc+19W7KyuMTeuqCemH8yB/Q5e9nu8aA=;
        b=U5A14V7ysTfc32QDQGyEJeKuF7S5Pq0fLpDtHEGhXXnq3rmd3JzACaBItPq5JKSAaj
         YFA5n+OdHtJG+U7UzabCtA+oGqs2bgpFFMSoqrcpgMktwiJt6gOoODDMZVUZedKn9CgV
         sUIuHM7HU6ppx9HPUw3wTKQTHWu4aL3WPIkD7c2JzOpcWKJL42i+rW6vA8gY/P4Ce88T
         L/AfvW80WUvzfH5iTcQ8mNrEotNNvWXtBAdQ3YiiqEr3aj2jx5tcRjgZAru+zXRPmPkW
         cwH04NGgR0Xltsx6ewK3HVU9pnF/oTwoU0XobOwchXRc66EvN8ONeux+t3LtcB984mJn
         hZMA==
X-Gm-Message-State: ACgBeo3omJ6LlVPS+5BZHnccvVd3FwSIpZnrXgVteHVU3iQ6Gsbf0jhF
	eKusNJ/BSnXt5Ibkrk2CcEs=
X-Google-Smtp-Source: AA6agR7tG4OqK0nNY0mWWPRkvmCx6vmHSl4Auf4Q6D2X/J23GoevX7VhHbkYiUTqyfiLEpEzMQzThA==
X-Received: by 2002:a05:6402:1a4d:b0:44e:221d:d1dd with SMTP id bf13-20020a0564021a4d00b0044e221dd1ddmr11469097edb.267.1662725914920;
        Fri, 09 Sep 2022 05:18:34 -0700 (PDT)
Received: from localhost.localdomain (wlan-244090.nbw.tue.nl. [131.155.244.90])
        by smtp.gmail.com with ESMTPSA id p17-20020a170906785100b0073bdb2f6f28sm167143ejm.217.2022.09.09.05.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 05:18:34 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 2/2] staging: vt6655: use memset to make code clearer
Date: Fri,  9 Sep 2022 14:17:56 +0200
Message-Id: <e545c514608bbef296baa37417d2c5af4403ee4c.1662724786.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662724786.git.namcaov@gmail.com>
References: <cover.1662724786.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A line of code sets the entire struct vnt_rdes0 to zero by treating it as
unsigned int. This works because sizeof(unsigned int) is equal to
sizeof(struct vnt_rdes0) (4 bytes). However it is not obvious what this
code is doing. Re-write this using memset to make the code clearer.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 3397c78b975a..34a65a92d602 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -867,7 +867,7 @@ static bool device_alloc_rx_buf(struct vnt_private *priv,
 		return false;
 	}
 
-	*((unsigned int *)&rd->rd0) = 0; /* FIX cast */
+	memset(&rd->rd0, 0, sizeof(rd->rd0));
 
 	rd->rd0.res_count = cpu_to_le16(priv->rx_buf_sz);
 	rd->rd0.owner = OWNED_BY_NIC;
-- 
2.25.1

