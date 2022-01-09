Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FF62CA1
	for <linux-staging@lists.linux.dev>; Sun,  9 Jan 2022 21:54:31 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id s1so23278415wra.6
        for <linux-staging@lists.linux.dev>; Sun, 09 Jan 2022 13:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hveg2mt6NAFmAOqnRmvpmxANd+423NVK0KBOAAWP8lE=;
        b=pyY1t4ThQYVXd1x8g3ik+TIk7SOSCor2/wWpDoFQBzj3jkoqe4gxEAXGT+efgGYHHa
         9EqFBlKL+vWdg80kV17YToFDcym/BQqu42RTvBFaRx9k1ihZYpMMrpNoN1oAPQcqiOjq
         gXSH606Iho+0hjCchs3AIzesiTUx7KQaWNAPxI5eoDm8vD/sUA4WYg86NLJxs1/72l9a
         OgFTbiFrcoPb8h2ei7/SkBLgoYmdx3PKAGdK2On+R3S4AVSDoC9vg7KRMxtoX1vrePlC
         81qS57MLaZVuex/IPdDVvql/Brc9EE5qdo3YD3s4LDfM+bjp+jE40g6veiT+S7v5tuz4
         54aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hveg2mt6NAFmAOqnRmvpmxANd+423NVK0KBOAAWP8lE=;
        b=QnjuQ5RJ/dTjChi5Iqh+JuRGycN7YCboDLKJu6qs47lBo9rcjrz+Axg/C1fXXN7AAP
         WuT13nffuKCHCYEKVOa/p6Zua2KXzj+XpZeqaUyh6SMUe97WDQB9yz8DEN6mq+rf/GBr
         VsIEJJR8pDmnZarK0aLFOFryTEP8hYXRTdZupU6KT/J2jrUla+cQkUyjDZOcTqbisVqZ
         Cy2I5UOZLXfhFDgHoO6oKcZ7CZyV5Jd+dmEuCc18vb7SZJm5altKejOBVGPo6BTpH66T
         I9Eq+ZyzBSOcfuYbX4v6OakZ2sTKJT6e/kQKUn8/C/FEBjktMyJmAvpT9e2DdfbAlgJ0
         Lw1g==
X-Gm-Message-State: AOAM532ovhSg1mdwPbujH3tE+qTRzzcUFEIJS9n+7z/xXVRyLmXtqp9T
	41eAdnNnwgYFv2mqLzj4whMlUA==
X-Google-Smtp-Source: ABdhPJxsUiANoyrrutgPL5f65+uXjzfcsJLj2fYFPnballPZagnGRDvkK9pJIGbMppkXKPt/366c0g==
X-Received: by 2002:a5d:6a0a:: with SMTP id m10mr5546089wru.296.1641765270412;
        Sun, 09 Jan 2022 13:54:30 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r13sm5065650wmq.28.2022.01.09.13.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 13:54:30 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] staging: r8188eu: convert DBG_88E calls in core/rtw_ieee80211.c
Date: Sun,  9 Jan 2022 21:54:21 +0000
Message-Id: <20220109215427.887-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109215427.887-1-phil@philpotter.co.uk>
References: <20220109215427.887-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the DBG_88E macro calls in core/rtw_ieee80211.c to use pr_debug
as their information may be useful to observers, and this gets the
driver closer to the point of being able to remove DBG_88E itself.

These calls are at points in the call chain where use of dev_dbg or
netdev_dbg isn't possible due to lack of device pointer, so plain
pr_debug is appropriate here.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 36 ++++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index ad87954bdeb4..25445f3ab4a3 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -655,8 +655,8 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
 	 * sub-type. */
 	if (elen < 4) {
 		if (show_errors) {
-			DBG_88E("short vendor specific information element ignored (len=%lu)\n",
-				(unsigned long)elen);
+			pr_debug("short vendor specific information element ignored (len=%lu)\n",
+				 (unsigned long)elen);
 		}
 		return -1;
 	}
@@ -675,8 +675,8 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
 			break;
 		case WME_OUI_TYPE: /* this is a Wi-Fi WME info. element */
 			if (elen < 5) {
-				DBG_88E("short WME information element ignored (len=%lu)\n",
-					(unsigned long)elen);
+				pr_debug("short WME information element ignored (len=%lu)\n",
+					 (unsigned long)elen);
 				return -1;
 			}
 			switch (pos[4]) {
@@ -690,8 +690,8 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
 				elems->wme_tspec_len = elen;
 				break;
 			default:
-				DBG_88E("unknown WME information element ignored (subtype=%d len=%lu)\n",
-					pos[4], (unsigned long)elen);
+				pr_debug("unknown WME information element ignored (subtype=%d len=%lu)\n",
+					 pos[4], (unsigned long)elen);
 				return -1;
 			}
 			break;
@@ -701,8 +701,8 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
 			elems->wps_ie_len = elen;
 			break;
 		default:
-			DBG_88E("Unknown Microsoft information element ignored (type=%d len=%lu)\n",
-				pos[3], (unsigned long)elen);
+			pr_debug("Unknown Microsoft information element ignored (type=%d len=%lu)\n",
+				 pos[3], (unsigned long)elen);
 			return -1;
 		}
 		break;
@@ -714,14 +714,14 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
 			elems->vendor_ht_cap_len = elen;
 			break;
 		default:
-			DBG_88E("Unknown Broadcom information element ignored (type=%d len=%lu)\n",
-				pos[3], (unsigned long)elen);
+			pr_debug("Unknown Broadcom information element ignored (type=%d len=%lu)\n",
+				 pos[3], (unsigned long)elen);
 			return -1;
 		}
 		break;
 	default:
-		DBG_88E("unknown vendor specific information element ignored (vendor OUI %02x:%02x:%02x len=%lu)\n",
-			pos[0], pos[1], pos[2], (unsigned long)elen);
+		pr_debug("unknown vendor specific information element ignored (vendor OUI %02x:%02x:%02x len=%lu)\n",
+			 pos[0], pos[1], pos[2], (unsigned long)elen);
 		return -1;
 	}
 	return 0;
@@ -754,8 +754,8 @@ enum parse_res rtw_ieee802_11_parse_elems(u8 *start, uint len,
 
 		if (elen > left) {
 			if (show_errors) {
-				DBG_88E("IEEE 802.11 element parse failed (id=%d elen=%d left=%lu)\n",
-					id, elen, (unsigned long)left);
+				pr_debug("IEEE 802.11 element parse failed (id=%d elen=%d left=%lu)\n",
+					 id, elen, (unsigned long)left);
 			}
 			return ParseFailed;
 		}
@@ -841,8 +841,8 @@ enum parse_res rtw_ieee802_11_parse_elems(u8 *start, uint len,
 			unknown++;
 			if (!show_errors)
 				break;
-			DBG_88E("IEEE 802.11 element parse ignored unknown element (id=%d elen=%d)\n",
-				id, elen);
+			pr_debug("IEEE 802.11 element parse ignored unknown element (id=%d elen=%d)\n",
+				 id, elen);
 			break;
 		}
 		left -= elen;
@@ -892,10 +892,10 @@ void rtw_macaddr_cfg(u8 *mac_addr)
 
 	if (is_broadcast_ether_addr(mac) || is_zero_ether_addr(mac)) {
 		eth_random_addr(mac_addr);
-		DBG_88E("MAC Address from efuse error, assign random one !!!\n");
+		pr_debug("MAC Address from efuse error, assign random one !!!\n");
 	}
 
-	DBG_88E("rtw_macaddr_cfg MAC Address  = %pM\n", mac_addr);
+	pr_debug("MAC Address = %pM\n", mac_addr);
 }
 
 /**
-- 
2.33.1

