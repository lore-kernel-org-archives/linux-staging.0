Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847EF5692;
	Fri, 13 Oct 2023 06:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDuWSIJW"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-32d849cc152so1691365f8f.1;
        Thu, 12 Oct 2023 23:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697179974; x=1697784774; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1fwSnEb/oGascEkxYNcgQ1DoI1EHky2CUmiF3z/VGsc=;
        b=NDuWSIJW0d8Gpbg3Moo6g+FhXiuAC4KoNDPn8ZSIBxZOaVP2TlObJAg1uigfyLuut7
         GONF5xUY35qhJ0Hk4b2prLParIVuCh05FkxPgVluS/UHreYw6eC4Nn2CQk1zejCPIAYH
         ajnROmXBq81AjcdN5EL/BkjQhxBDjHHHf3+nuLjFE5vnqJJ2rzMZa00F3TUuDJHPL2x+
         uGeTPt491fpDFDPlO59U+MJRqQdNcD8/pgqa1a4Sxjeqped/Og6jsuo6662hXBI8F4B8
         6o0gazstvtYgy4f47lOGuNINLp1WzTYCNNTveEU9LR/YLaVSYNY1Z/jHLWYzF5kL6O/2
         1j/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697179974; x=1697784774;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fwSnEb/oGascEkxYNcgQ1DoI1EHky2CUmiF3z/VGsc=;
        b=VMKSW3I0FJnS2wL/zPK+l2ctX99hElKRC8D1A21ihLrbAwsz188zE+ur1iABcgvRLY
         KVodshwqADa2EnKNrO7ISgSJGcFcWI+ZYcq7QjsSzvp3HDsx53Jwhak97jnQ19BMZhpi
         f0zeVFUZP/vMVv9I8mEQs2EWBhjum3dM7s4n77008RRq3aHncSFbm9zN29JoWpas48JX
         Ex5FVDRO4mdRceUkyXVkv3PY3E1Ezn4YZ9aSFI2VB1iaAD0zq/tcpRE+gKs7p6paQQda
         g1s2RJSH2K4oeC/BIUNJ7JImnxKv6f2M56yiipYsrp13ZL+G1tgkRIzjTD9hui/H9/L0
         lLRw==
X-Gm-Message-State: AOJu0YxkxKb7kjVVhln5rjQHhtcTc04qAH/K5khHsK0oVHJdDZINTB5/
	HI25MriaCWC3GF9ksDysVnI=
X-Google-Smtp-Source: AGHT+IGMvyjlULk/r5LkFCrZSMyEp4or+xvVuLLJOmX7A/O77IAh6ozNhv8iIiCmMKKwFR0y5b4qsQ==
X-Received: by 2002:adf:f449:0:b0:32d:9daf:3f94 with SMTP id f9-20020adff449000000b0032d9daf3f94mr536713wrp.53.1697179973479;
        Thu, 12 Oct 2023 23:52:53 -0700 (PDT)
Received: from lab-ubuntu ([41.90.69.21])
        by smtp.gmail.com with ESMTPSA id a1-20020a056000100100b0032d9efeccd8sm377463wrx.51.2023.10.12.23.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 23:52:53 -0700 (PDT)
Date: Fri, 13 Oct 2023 09:52:50 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Calvince Otieno <calvncce@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: wlan-ng: remove unused functions
Message-ID: <ZSjpQlUcyOoYv4Yh@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following functions were defined in the prism2mgmt.h file but neither
declared nor used anywhere. It is recommended that they be removed.

	- void prism2mgmt_get_grpaddr(u32 did, struct p80211pstrd *pstr,
				      struct hfa384x *priv);
	- int prism2mgmt_set_grpaddr(u32 did,
		                   u8 *prism2buf, struct p80211pstrd *pstr,
	                           struct hfa384x *priv);
	- int prism2mgmt_get_grpaddr_index(u32 did);

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
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
Calvince Otieno

