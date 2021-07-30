Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC63572
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 14:54:14 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id ec13so13052932edb.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2xzaJrImseVsg0eD7eqvnQOqrBfMMMSbm0GmyhxbspA=;
        b=TqjqRojEeoonR+e/y6+Hx6KQ6WdoPOvXxyKdLVTVWUFRM5KFTUSlLSXtR9E9iJ3Bo3
         z5eawBJm4Qf4L1basdD0Ms+9ZyVid5buEFyE6lzA3FEOHL6N7wRvCWL6dnEQ25t+BK5J
         ZuP3s2Qcs0Z6GC49LzttaKfvZzu/Z+e25ySX7B2xAuaH8bYZQZuXsdcpnJc6BmdwRpb3
         MnhfuiHGxpBfE7Dif/2Tc2gx/jBEP9E4z/iePfnnFRGIfzG17dNGzG3OtZcZ+j9xhxUS
         NJDJ6H/dKYs2HPIi6LJd2t8vs4BYEfe+T4oHnu/Ys/hKDFoFrzdfrYZbXxrv2uCT+sDk
         OVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2xzaJrImseVsg0eD7eqvnQOqrBfMMMSbm0GmyhxbspA=;
        b=YDfbyA0sWu3Pqu2vavnUxKxxBkRL/+4jyKGC9QyYDfRNya/3P6vVl8dTPi8ZT0bfE9
         H26/YFR6JROO/jH1s2UbTgTTIEsRScUPCN02N8NW0N7RdTzniUCeEtw6lYmAWa7B5TwV
         8Kep8Zr8H4InjftKjtbgvh9BDZqUKvuSqKEgF9DV+upDcbyZMkPBXnzF2TH6nJlSGbTR
         1+WgpFoj4NfGirHtH/JoxVZ7bZT7So3NvRwrQeRdMJYtqohGgOeoszEdCJVsiOCohVIh
         ewgsYGqYWpBR+ISvGykm2THBNGJLGi1yGRgI4OpfwHyk82YKcXOQ2bgPpBSmA9g9wXlz
         8B+A==
X-Gm-Message-State: AOAM530Ir0exoeX4P5+PTguhJxHty2TpWo9bW9F4DZXFsrZYm9vdNHBk
	b9EjYI34qEE3/+SKj+7YL6g=
X-Google-Smtp-Source: ABdhPJxV+jqRQRU4MYngKlnSSf9iiMKrjIyyZ4MaEz1h2sBi9Ee5Hnv03Z87rt9CEUkAnCgYrwgEow==
X-Received: by 2002:aa7:cd03:: with SMTP id b3mr3473884edw.304.1627656853253;
        Fri, 30 Jul 2021 07:54:13 -0700 (PDT)
Received: from agape ([5.171.81.215])
        by smtp.gmail.com with ESMTPSA id fr4sm642921ejc.42.2021.07.30.07.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:54:13 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] staging: rtl8723bs: remove unnecessary parentheses
Date: Fri, 30 Jul 2021 16:54:06 +0200
Message-Id: <fca83a857ebb158cf395ea31f1834c04402c39e4.1627656773.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1627656773.git.fabioaiuto83@gmail.com>
References: <cover.1627656773.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch issues:

CHECK: Unnecessary parentheses around
'pnetwork->network.ie_length > target->ie_length'
33: FILE: drivers/staging/rtl8723bs/core/rtw_mlme.c:604:
+		if ((pnetwork->network.ie_length >
target->ie_length) && (target->reserved[0] == 1))

CHECK: Unnecessary parentheses around
'target->reserved[0] == 1'
33: FILE: drivers/staging/rtl8723bs/core/rtw_mlme.c:604:
+		if ((pnetwork->network.ie_length >
target->ie_length) && (target->reserved[0] == 1))

CHECK: Unnecessary parentheses around
'target->reserved[0] != 2'
39: FILE: drivers/staging/rtl8723bs/core/rtw_mlme.c:608:
+		if ((target->reserved[0] != 2) &&
+			(target->reserved[0] >=
		pnetwork->network.reserved[0])
 			) {

CHECK: Unnecessary parentheses around
'target->reserved[0] >= pnetwork->network.reserved[0]'
39: FILE: drivers/staging/rtl8723bs/core/rtw_mlme.c:608:
+		if ((target->reserved[0] != 2) &&
+			(target->reserved[0]
		>= pnetwork->network.reserved[0])
 			) {

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 9f97986e8680..df599c2009b3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -601,12 +601,12 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 		pnetwork->last_scanned = jiffies;
 
 		/* target.reserved[0]== 1, means that scanned network is a bcn frame. */
-		if ((pnetwork->network.ie_length > target->ie_length) && (target->reserved[0] == 1))
+		if (pnetwork->network.ie_length > target->ie_length && target->reserved[0] == 1)
 			update_ie = false;
 
 		/*  probe resp(3) > beacon(1) > probe req(2) */
-		if ((target->reserved[0] != 2) &&
-			(target->reserved[0] >= pnetwork->network.reserved[0])
+		if (target->reserved[0] != 2 &&
+			target->reserved[0] >= pnetwork->network.reserved[0]
 			) {
 			update_ie = true;
 		} else {
-- 
2.20.1

