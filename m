Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55769CA4D;
	Sun, 15 Oct 2023 20:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0FVcy7G"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so42051125e9.0;
        Sun, 15 Oct 2023 13:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697400142; x=1698004942; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FG9AttEioQfqRDZbNIP/22fcyG3rw6EjNALMu0XvLK8=;
        b=f0FVcy7G6agAFRF8V5U/hrVuTnHJYWFBE7dxjXuxzMcJewFRyk9mrNzU59l+JSxLdg
         OD4ICSZoRNWVwyf8OdVGHNyJBSG6xmiskwZvpASFhBg7MMK48zvEifcF+Dzf1u/sn9JK
         2iDn1n2LxgcE+DWvP41Q80C5laT1t6djd7SyFHSJXuIVTgpkCLOH6SGl3tuTknsTT4iV
         ODZTxmCMhScXSd6CFCXBEZusK3QBVbv4GE1DlnNjD2r147mntDlGR6SUnrfuHDJ1wkVk
         Yj/5As3BomxAOOMRr5Mpu7ZGNOAMrvhRWTs28UdvP4bg//1h2dQusI+hyOpF01wpI7RP
         Wt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697400142; x=1698004942;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FG9AttEioQfqRDZbNIP/22fcyG3rw6EjNALMu0XvLK8=;
        b=m4aJa5kUppRqsheq9H2iWfmbehGuSqHjLlY33qekdV37qkJZq6T6hRYCGoRcPsJgVa
         cvNGuVM7L5DxKCIA9xEhUjeypkVXm+itqZR4hWpjwA4Pjeeb6TJKvrkBgJYc1hcB8e8F
         L6QmKiGKftMqRQd/40HR9oWv4Ynq+0EzkDs0/oY4eCxXtjzkjip9NtZAHlGZtehc1pkN
         VguEz0djMxWmscQTsCNs1EIMH3octaDW4w+pNWQZ3XL+WIgdQWI+g3zYDcWA/qxyzC2s
         ZRkwr9Ht8IbycZf0TovxyRGINHNJn0tG+V7lj7+vcEOzgzlA16hZnhgsDGgiFqikO7CC
         qYXw==
X-Gm-Message-State: AOJu0Yy5LDLArqn36MeaETKjNgixo5QND1XnI5aSpVv5drAdiUfuUo3N
	G7JZe7AnSKVjjR/SP1wnVeg=
X-Google-Smtp-Source: AGHT+IE4bDbkmn4bZXjxYPES1Y7BM57oxEqu857Y/Z3/gW1gzo7nRe65Gb1fFRiWjp5zXul1UtQoaA==
X-Received: by 2002:a05:600c:2298:b0:406:4573:81d2 with SMTP id 24-20020a05600c229800b00406457381d2mr26922024wmf.39.1697400142167;
        Sun, 15 Oct 2023 13:02:22 -0700 (PDT)
Received: from lab-ubuntu ([41.90.67.11])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c4fc600b0040472ad9a3dsm5294765wmq.14.2023.10.15.13.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 13:02:21 -0700 (PDT)
Date: Sun, 15 Oct 2023 23:02:19 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Calvince Otieno <calvncce@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Solomon Peachy <pizza@shaftnet.org>
Subject: [PATCH v2] staging: wlan-ng: remove unused function prototypes
Message-ID: <ZSxFS8EnFr998PqS@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These functions are declared but not defined or used anywhere. Their 
definitions were removed 15 years ago.

prism2mgmt_set_grpaddr() was removed in the
commit 1e7201836c57 ("Staging: wlan-ng: Delete a pile of unused mibs.
And fix WEXT SET_TXPOWER.")
It's signature was changed in the commit 5a2214e2e02f ("staging: 
wlang-ng: avoid new typedef: hfa384x_t")

prism2mgmt_get_grpaddr() and prism2mgmt_get_grpaddr_index() were
removed in the commit cbec30c4c00c ("Staging: wlan-ng: Delete a large pile of
now-unused code.")

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
Patch v2:
	- Updated the patch description to include the commit history indicating
	when the function definitions were deleted.

Patch v1:
	- Removed the function declarations

 drivers/staging/wlan-ng/prism2mgmt.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2mgmt.h b/drivers/staging/wlan-ng/prism2mgmt.h
index 083a055ee986..8c3f1ac35913 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.h
+++ b/drivers/staging/wlan-ng/prism2mgmt.h
@@ -78,14 +78,6 @@ void prism2mgmt_pstr2bytestr(struct hfa384x_bytestr *bytestr,
 void prism2mgmt_bytestr2pstr(struct hfa384x_bytestr *bytestr,
 			     struct p80211pstrd *pstr);
 
-/* functions to convert Group Addresses */
-void prism2mgmt_get_grpaddr(u32 did, struct p80211pstrd *pstr,
-			    struct hfa384x *priv);
-int prism2mgmt_set_grpaddr(u32 did,
-			   u8 *prism2buf, struct p80211pstrd *pstr,
-			   struct hfa384x *priv);
-int prism2mgmt_get_grpaddr_index(u32 did);
-
 void prism2sta_processing_defer(struct work_struct *data);
 
 void prism2sta_commsqual_defer(struct work_struct *data);
-- 
2.34.1

