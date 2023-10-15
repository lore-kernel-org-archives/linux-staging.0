Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0346FDA;
	Sun, 15 Oct 2023 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtgJLkK7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4066692ad35so37589555e9.1;
        Sun, 15 Oct 2023 07:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697379901; x=1697984701; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uFgPztQppmCCCzmM2GEubbYdc8VreQZXvcgDjFAmCwY=;
        b=HtgJLkK7CL2R1VhTDzjnuHG5FTf/VaAB6XN1MRB6lde8rFkuXj9OEM0pKh3DgEq4g0
         bFAlSvaj1xHYoGbhukjsZYZxa+a5ZLNzlSXJ1i5MjPyiW2EpWeLEFArFQdL35D8AOEgn
         VdTp7rX8xc9VjWLbw+0TCbnFBfJ10NnbkojFYmtIvUIFK91VD+ZgVAu6k9Va9pvL8QZs
         yZDikjrIlJuUKYXt4QbCKr1xGyu1nB1lxYJA8itwPB6GMWnBdqKIfyucjh+fa8OhL/av
         9W4qSmCJ9nypzlGQPzVQX8xQRSl+ogeLlboKfCuhGUgVWxgFakrUfCR/2n5CQHjFFiOo
         oqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697379901; x=1697984701;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uFgPztQppmCCCzmM2GEubbYdc8VreQZXvcgDjFAmCwY=;
        b=v1uTfMeveSPrplSPYZ9Cphj6tSiz912XgxOosbjq6pP5alSqMscmxBrbSCqJDTYAtV
         c4HZhAyxxz3ApVdZ7nw+KD150vmqv9PcI2NyiQXuw02Q0kwEV90KllZtmfUOnAFP/B9q
         CECEd7FUvQf3ponYvpYEkuwWuzjUf6lo75xNUV6uCGs0kzHN2wAt+NWSC67TF7fLg9wO
         YVQ3RNfarvXOJBB55PltOFFRmNHazW5T8HOUwt+LEoaDRNibi913QLwVGZC4m7KKmKhl
         XCnzZCx8vN/15/vjxgeYAOH3ca5fKnk7vLspXsj4UGsBclYCnIW+yfSYDU01VouTSPHR
         pO9A==
X-Gm-Message-State: AOJu0YybDQWdmpXXF0S5q4KyAZqP9NhTsgZPEDlwtRGGjEHG+cijUQl3
	+0PtTeRByO3cjT6gqTFuvdY=
X-Google-Smtp-Source: AGHT+IG8pluCHBLBeAuWJR3Muz1UtlfXuciY2kmnoEUaLPJIdbX0bCo3ucqK6FD4nZKTCgya+om38Q==
X-Received: by 2002:a05:600c:2a4e:b0:406:3f62:e591 with SMTP id x14-20020a05600c2a4e00b004063f62e591mr28059955wme.41.1697379900390;
        Sun, 15 Oct 2023 07:25:00 -0700 (PDT)
Received: from lab-ubuntu ([41.90.64.203])
        by smtp.gmail.com with ESMTPSA id p10-20020a05600c1d8a00b003fe23b10fdfsm4624604wms.36.2023.10.15.07.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 07:24:59 -0700 (PDT)
Date: Sun, 15 Oct 2023 17:24:57 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Calvince Otieno <calvncce@gmail.com>
Subject: [PATCH] staging: wlan-ng: remove unused function prototypes
Message-ID: <ZSv2ObWLvlbM2hXn@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These functions are declared but not defined or used anywhere.
Their definitions were removed 15 years ago in the
commit cbec30c4c00c ("Staging: wlan-ng: Delete a large pile of
now-unused code.")

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
2.34.1

