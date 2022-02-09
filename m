Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1E22C80
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 16:37:46 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id i186so5322413pfe.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 08:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0vet+O2rGnFiskNlqhwxrF6FgDwyWi3qflGBq8sFXSg=;
        b=hYDsgSlSr/myCTMTPauwPSbIqJwq91i4Ad99E3j9EWZn3uYbMsG56XsgsM14Wud4uH
         9zXaI3AcGWOD5ap1n+xEwT7NFMlZEc9PhekO7isSG8nSZ2VpAVxBH3Odxk1VXCL+jhAo
         jr6/NkJPB2oKeOSdxOIVCOS/WGbQPfM2wTrC3R9EyzKO4zI3dpiQkMgAMiydQ3uvCp3M
         cxknrEYKq3i5DkEuMmyh6OIS11alEB6gb5WBuB7QqW9Diuy8rgjwIe6utWy6PokcE099
         +9kyqt92fosGAXLTJfqgD9JuZlnaaUbRPWP4bDA9s+4mfxR4XPc2sncnB+/oiwcA8zuZ
         NkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0vet+O2rGnFiskNlqhwxrF6FgDwyWi3qflGBq8sFXSg=;
        b=jfXK4I298FQMYFX3BuGqljQU5nX1SczX76EvKkS0qW7q1+ZBm0ud/PKxxecrskpwHV
         qI6SHnGxt8l8fW0KCQnw6pO1nO8dxnSqhfCHw6HSuke7u8ywMvWZBA8Via7G59ThWhcc
         6qs+t3Xm/m10KCoEheDdKZwjIZiC75K7otxA4SoOKNjxwJ+PIjGI4teUFy15Kn+Lcdhz
         w4mAzb+5Xm7Q8agbkHyfzxhCGQXSciCUWc30wCH6o5/PKG+Fddd0zTZDNGFHwoZ+yJ5W
         RPekYAO4H2BWv1cOxG2kR4H5LBoZ4DWrJharZ92Fl8r+ajpu6ItCZ6dKviATFDqhKbYH
         HXig==
X-Gm-Message-State: AOAM532X/lCZT8nSr+wwlZGLWWaYart9h9vbYk5Ub0pYdvGbNrie0IuX
	BS/6x6hazeRtEutmUduyWGY=
X-Google-Smtp-Source: ABdhPJz5ggxrou03TQF9NHVmn3tHgYV7ulu5h9yCm4AAab1Xu91lUCMmo+8gDrIF20eqGqk07uVBzw==
X-Received: by 2002:aa7:9576:: with SMTP id x22mr3229262pfq.56.1644424665939;
        Wed, 09 Feb 2022 08:37:45 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id kb18sm7840199pjb.30.2022.02.09.08.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:37:45 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 6/9] staging: r8188eu: remove unused argument in __nat25_has_expired
Date: Wed,  9 Feb 2022 22:06:04 +0530
Message-Id: <eceb38329e108c1e440eb973492a5a1c17bd7927.1644422181.git.abdun.nihaal@gmail.com>
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

The argument priv is not used in function __nat25_has_expired. Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 088145118b41..5c40babcd45c 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -105,8 +105,7 @@ static int skb_pull_and_merge(struct sk_buff *skb, unsigned char *src, int len)
 	return 0;
 }
 
-static int  __nat25_has_expired(struct adapter *priv,
-				struct nat25_network_db_entry *fdb)
+static int  __nat25_has_expired(struct nat25_network_db_entry *fdb)
 {
 	if (time_before_eq(fdb->ageing_timer, jiffies - NAT25_AGEING_TIME * HZ))
 		return 1;
@@ -363,7 +362,7 @@ void nat25_db_expire(struct adapter *priv)
 			struct nat25_network_db_entry *g;
 			g = f->next_hash;
 
-			if (__nat25_has_expired(priv, f)) {
+			if (__nat25_has_expired(f)) {
 				if (atomic_dec_and_test(&f->use_count)) {
 					if (priv->scdb_entry == f) {
 						memset(priv->scdb_mac, 0, ETH_ALEN);
-- 
2.34.1

