Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB84A3C
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 15:44:45 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so19299431pjd.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 07:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7LjvNmFYtzAsC25vAMO2QJVZc+XB+9EQbUS0DGrgDU=;
        b=PbtGMeNvAH5sIErnJlF6RN06SEJnTPL8q12+rDbTGlHAKJpHr0/UEd6FjY2fkUJYJI
         bgMVaGltlxlu4GlPqWSRBWfcPCt+uq4KLfXtUVgDHjtF6JdR970o168kKpLE0LQhx79q
         kwcA6bI/OrGQb7G9zTggSvNdCDl3+QbqU46rfd4UGDSqqAukuDxwvs1D9G5zW8msAbiK
         zkCN8LgWAphOl6WhLo3sFYqvsl5fJ+srt9vfEQMGiARNJgUpTEQ576W7DpQuc8ENAYDv
         1QU9t2DHmukVcxAJ5EdvvGDmxZELRrk44NqW1Bwi7B84o0KAFYLhsoA88N55MIRq+EfH
         MG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7LjvNmFYtzAsC25vAMO2QJVZc+XB+9EQbUS0DGrgDU=;
        b=49v2pPfng6vGEvUMWULOVD/UBgzy1pEc0MQ4Ekby+EQtCOL/OAt7E3VjgCqu+Mp4CZ
         Tng1PBown8ocpJsMAS5FVsJ0OAqUpB4Kjusqqa0Nh5Kfjsc9+aVc60t/+A+kgtENOXnP
         QqKHEk0iylo7hoYaemO0Lj8RFBeqyn5t2CSnXX0+lS14mvFE+2r+vCUM/fDQHYzXdStR
         d4JvbKH8Zeok9eORLsbkgJBYurcMHUz7xkt5I3xTnmIBw/ml0zcOtV+TwODh6iwlA/2D
         06ifG2i1iJuX42WONjl/wIEnRFY9YKE3Uu5Dco3dg1Qxx9kPNQ+Q7X4imCHs6V4jLzKI
         1sdg==
X-Gm-Message-State: AFqh2krDCZtRf35QsEW++clIcqzeNjJDR9rVcdQXFcpmbD0WDqGZG/Xd
	5VbPFrEU11phappN5nHapLQ=
X-Google-Smtp-Source: AMrXdXutZbebfznjrJ8oCu7nv3tPPes+dfGDmenFp2dGlXXTRGJP1wI0skuRmwgaZsuQ5tdl0s1tbQ==
X-Received: by 2002:a17:902:ab14:b0:189:c62e:ac34 with SMTP id ik20-20020a170902ab1400b00189c62eac34mr33777332plb.47.1672328685007;
        Thu, 29 Dec 2022 07:44:45 -0800 (PST)
Received: from local ([202.131.133.58])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f7cd00b001743ba85d39sm13231993plw.110.2022.12.29.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 07:44:44 -0800 (PST)
Date: Thu, 29 Dec 2022 21:14:38 +0530
From: Anup Sharma <anupnewsmail@gmail.com>
To: gregkh@linuxfoundation.org, drv@mailo.com, ztong0001@gmail.com,
	dave@stgolabs.net, nhuck@google.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: rtl8192u: ieee80211: Fix indentation errors by
 removing extra spaces
Message-ID: <Y6215u/jtmcgO6TY@local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove extra spaces before statements to fix
following indentation warnings reported by checkpatch.pl.

WARNING: Statements should start on a tabstop
+	 struct delayed_work start_ibss_wq;

Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
index c5c43d2fb93e..694d1b18f81c 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
@@ -1823,7 +1823,7 @@ struct ieee80211_device {
 	struct work_struct associate_procedure_wq;
 	struct delayed_work softmac_scan_wq;
 	struct delayed_work associate_retry_wq;
-	 struct delayed_work start_ibss_wq;
+	struct delayed_work start_ibss_wq;
 	struct work_struct wx_sync_scan_wq;
 	struct workqueue_struct *wq;
 	// Qos related. Added by Annie, 2005-11-01.
-- 
2.34.1

