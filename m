Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD6BFC1B;
	Wed, 13 Mar 2024 04:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710305107; cv=none; b=bE+dIzncIPA6d+iZdRzHEQSpWnKYAa0ykF6bUrUAsH5/FEU/qgM3sepytxJQ6pBl0YYtUZ/qwzXIqN5vcmnrLz9GXpnJg7uHMGnU9VIGG/f6IBC07m8uE/9AtvLpUE1FjIplW8SFnVXCW7YmkTr9p9+L6BPjig0AVM6ST6q16XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710305107; c=relaxed/simple;
	bh=9KhB8FDCdFYO+YWIrsqRrpS86HEbNgdQ0AxmoAdA4J8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhSxiSuag6BdPwIbGMNXy3x+jdxGlA6RiSvctOAqzxTbwa8giwIMeUG7sE4vF+MugWBh/x1Poh/oBJA9eQBsBPMJLba/aobwp0sL72f6STcUUb9ZEBgAsFIDuYbBDGp8wJ5iHNTYUVrgzhsXT2GRjeH6x0fIoCfpHwjrT7hnXhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Isxd6YeG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Isxd6YeG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-413e9a2b3e7so1608375e9.1;
        Tue, 12 Mar 2024 21:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710305104; x=1710909904; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8byZJxMSUx+id+6lvl5IMqP93XziG/dgJmLwqeA4Dw=;
        b=Isxd6YeG6eImFRqxHXfl4Z6k4V0Sb7JOScj5jpuqnaVst1JsmCD4U2iweppy0DzGQd
         ijfY6oX2Vf8KmDZmNRmr5v0f3M9QJA5SX3WLSvZs4kHjwZKqPvwqbPr3ihy01iSCjxk8
         JLVlUYOvuG/PwUZmQzY4CO/b7kB0QnBIeXH+x13/K06kIw0S7K8hlvXJww3QYs1sAIp9
         oy/jkxolyNctcDWe0CljFVrLBdZnqpvakLYu/Z7jdl0+O1biT2yNa3SLUNIr+d5sYJxW
         nLYWNnK/5g3ADbWS4Egs0W1FE+PxfANzUGuwW29Pj38F5+m1pY1m8uNGhUC5I/776uLv
         PaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710305104; x=1710909904;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8byZJxMSUx+id+6lvl5IMqP93XziG/dgJmLwqeA4Dw=;
        b=ECpFcuaBDJdXYCdfrBgGG9n8AY8vPY31s2Yo7Wwv9PyhiTfbQsDn+ggoBNlpSpjfUq
         DNLVSy0nX87fi1QWTB4/9zVpHA5fbB11iY3frrZnQIMaTCH6a4tnijJ9BFAko3nm2fv5
         pEwmJwl/YanPmhVwwZLoWvm5xxYo7ZDkASEydpayr9dQnnmpQWfm3f4QYnaU26cKpu1x
         13IVYGb2EqpGCD1DElURf1q0/Qo7VRP8LfwcVdWRG1IRycOMvdQLznBTKWE7N513GCWt
         nspLhry2sfXytMvqOeWb5GJCgvL9bpvYFIxy5GMNSNsY6cTdp+3FeLMT015uKZQsMJyS
         pdnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn/hYWwKgLCnyTyt4lJFJoCd0oWZ6TmPGBxECNfRsuAaMqSBiHwHXG35gXVkQwS0t4JQZsF6SGDcIH/jIxYeNXohkaXUEk4Uz1+vLelw==
X-Gm-Message-State: AOJu0YzxAbnEb0BCKChw+rkFWpmnPVsECwUCx17EaZBEUZdlOnMHxTBV
	YNAWsdD4Top6nVADmPfQaLHZrzo/izNOWQQ6AmTUFMtDI8e99lteQfmdy4UCYwA1sA==
X-Google-Smtp-Source: AGHT+IGkqx0p4rVxFYIYDInIBZWZyO4WazzTYe+qhKbDXfnbrxGem42x2LXbWUVCZ8lKhbm4OBOarQ==
X-Received: by 2002:a05:600c:4fd3:b0:413:30dc:698a with SMTP id o19-20020a05600c4fd300b0041330dc698amr3700064wmq.25.1710305104005;
        Tue, 12 Mar 2024 21:45:04 -0700 (PDT)
Received: from MOLeToid ([129.0.78.232])
        by smtp.gmail.com with ESMTPSA id u1-20020a05600c138100b00412e5f32591sm986713wmf.28.2024.03.12.21.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 21:45:03 -0700 (PDT)
Date: Wed, 13 Mar 2024 05:45:00 +0100
From: "Felix N. Kimbu" <felixkimbu1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4] staging: wlan-ng: Rename 'foo' to 'rc' in p80211conv.c
Message-ID: <ZfEvTF7qwYZORGsY@MOLeToid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename identifier 'foo' to 'rc' in skb_p80211_to_ether() and
skb_ether_to_p80211() to match the common kernel coding style.

Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
---
Changes in v4:
- Remove changelog comments from commit log (AlisonS)

Changes in v3:
- Create a proper new patch revision (AlisonS)
- Use 'rc' instead of 'decrypt_check' (AlisonS)

Changes in v2:
- Fix wrong indentation introduced in v1 (DanC)
- Correct subject to include driver (PhilippH)

 drivers/staging/wlan-ng/p80211conv.c | 30 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211conv.c b/drivers/staging/wlan-ng/p80211conv.c
index 8336435eccc2..7401a6cacb7f 100644
--- a/drivers/staging/wlan-ng/p80211conv.c
+++ b/drivers/staging/wlan-ng/p80211conv.c
@@ -93,7 +93,7 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, u32 ethconv,
 	struct wlan_ethhdr e_hdr;
 	struct wlan_llc *e_llc;
 	struct wlan_snap *e_snap;
-	int foo;
+	int rc;
 
 	memcpy(&e_hdr, skb->data, sizeof(e_hdr));
 
@@ -185,14 +185,14 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, u32 ethconv,
 		p80211_wep->data = kmalloc(skb->len, GFP_ATOMIC);
 		if (!p80211_wep->data)
 			return -ENOMEM;
-		foo = wep_encrypt(wlandev, skb->data, p80211_wep->data,
-				  skb->len,
-				  wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
-				  p80211_wep->iv, p80211_wep->icv);
-		if (foo) {
+		rc = wep_encrypt(wlandev, skb->data, p80211_wep->data,
+				 skb->len,
+				 wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
+				 p80211_wep->iv, p80211_wep->icv);
+		if (rc) {
 			netdev_warn(wlandev->netdev,
 				    "Host en-WEP failed, dropping frame (%d).\n",
-				    foo);
+				    rc);
 			kfree(p80211_wep->data);
 			return 2;
 		}
@@ -265,7 +265,7 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
 	struct wlan_llc *e_llc;
 	struct wlan_snap *e_snap;
 
-	int foo;
+	int rc;
 
 	payload_length = skb->len - WLAN_HDR_A3_LEN - WLAN_CRC_LEN;
 	payload_offset = WLAN_HDR_A3_LEN;
@@ -305,15 +305,15 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
 				   "WEP frame too short (%u).\n", skb->len);
 			return 1;
 		}
-		foo = wep_decrypt(wlandev, skb->data + payload_offset + 4,
-				  payload_length - 8, -1,
-				  skb->data + payload_offset,
-				  skb->data + payload_offset +
-				  payload_length - 4);
-		if (foo) {
+		rc = wep_decrypt(wlandev, skb->data + payload_offset + 4,
+				 payload_length - 8, -1,
+				 skb->data + payload_offset,
+				 skb->data + payload_offset +
+				 payload_length - 4);
+		if (rc) {
 			/* de-wep failed, drop skb. */
 			netdev_dbg(netdev, "Host de-WEP failed, dropping frame (%d).\n",
-				   foo);
+				   rc);
 			wlandev->rx.decrypt_err++;
 			return 2;
 		}
-- 
2.34.1

