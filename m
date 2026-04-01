Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F85408226
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044234; cv=none; b=IPMJuavYP9Iqyk619GPq6JmznGcOkvAsv9QHyiBRKx6RZ6fO8cfHTI48t3hvMEmaaBpVaVh2HTPt039fS58fhxWimt89X+9/HD6L5fDYd3nM9DRdVAeUPlzJLE6+YW5l8GDXmwB38LIIg1CxnSKaJLfVlIfhARM1We8qSxuA8qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044234; c=relaxed/simple;
	bh=eUhmrzdVT25OCdkUeNH4JVa+khkI4tspDIT/bFWYQkE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i2O9al2NUz6P8QeI54QbElVrjXfqwd61a90swE463R91ksN3OESuyq9xFgA9/vcl5sietg9rZzcdiz00v0k89VmvrNUme31WVO8wMBbIfTwvGgddYs9wHzxKJ3zX/wE+mvvIghzw9zUlG1E6MV5g7nQO/BeecsFo76ygoZa6tYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IG11t2SW; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IG11t2SW"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1279eced0b9so9187714c88.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775044232; x=1775649032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aT6V5P+e0JsAA4WNCPskshxPOVxvhnhHL31tSzgUe3w=;
        b=IG11t2SWrtVc6usxzaZrl7aqtxbFR22mXhQ4ojW0qcs2x/+GN1wm7BtWUaUQcHbMaX
         EcqaUmS70HRWnHNEYDQwtMv0zFD5PoWGkBwDcPUteK5rbMnYkfJXiUFlObUXDRP9IxPn
         cI1TDq5lAH/7wLXjLyf/zenZhaURy9V08otVf49+wiGgHISEGiWT+9hx8E7sX4C+UyCD
         ziz4wiRZybh/kjB/5QQuoinyi/80Lk9JePkcR2Mxf1YbQWdZ7QhktxCIR3s7GY5apvlg
         zUkxuUVVNNMsEHgxZXnlw438NgyHX/QC15mc20MdGshSKGGlMueHoGa0jUfx7ykf6QKh
         ae+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775044232; x=1775649032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT6V5P+e0JsAA4WNCPskshxPOVxvhnhHL31tSzgUe3w=;
        b=lUgJxu1HmWeRJ3LGUn7esXAW0cedL+zxKPdQkS069wV7otkL24aeH3AOrl/udqEm0J
         lrPdS1JR4+WUEZgXFcXA7xkMaUXOQ7F1VUZrixTj+nIEKFZrr7OjiiSMOJPGPoqAcG/U
         xs3R3rf0ErETHBrHrg/yaMBSSHj5Q5CvS6rF+sNif0deLrdkcG7Qv+aTSzdsxW3f3ZAV
         VQtfrnGzK34o344BXfnilbH2qEd8B0cHo7kjMbqrWJP8J8BDrg70XWwV53c+x0mFN1Ij
         +Wa1hMyKucV4+f0HVBDHo1ajBG7fihfemcOjglg2Heuih9D7pyhnav1zD9uFRPM3jrPS
         0AaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKf5nszj4K+hHzfWcy8fjj3GGf+X94HqU7TCLBnIlvZkly2GZjvtw8nCsixobSmldOZjuyBRFX+AepHPHy@lists.linux.dev
X-Gm-Message-State: AOJu0YwAV/SJW8GDMDFQGN4GguE9O0rs4Kd96IbU3HtI1AhPS2tyM9Ph
	UVc5rkp0hIL0uEO9x1aGn5iDMDaCW1mnMQI9L5KLhT1FRXVP0B5syK7DP8DZJwqdyiM=
X-Gm-Gg: ATEYQzxvBbw7DimZF80RQMSZdWuU1xr8qtRLel+1X2stJJXUmrYYqGoPF3byktY2k6u
	Yyvhf4Epxu15fYe7g6kFhciBEzXss1HPzm29fBz5Mv9Ry1X6pc1AXhhgfsN6uroJI7iC5+U84mU
	8X7BQkI2uTnBKjPwesHP67kOYCMnubjigCrdk3+Wa75jzi9gg8SmJP5Bfgi1zzgJH+X75GNoQBT
	EW7oPCo7xaARiwu2W/cIOocYWUdVfkdBo0EEwoN+YdpDn5MO94KUH8YKygmOdrnMuW05k9VaP5G
	hkkUkR7p6lqVURDGnU11PQ5k5O9DsHUbOYudr/Xhqba75fRVQ9t1w1SoUSv3s2Ph+kjpn8TcXoH
	iq43iSNHFKBquOVq50N/eDMRGR+BJSSpQiS/7vRol5oNFEfTpHqG10z0cprK6yUMaaPZqzFUmNB
	Z5NK7rBfxSH+OZY7NmJRWPkuwrfDw9I1xoHa3CRwCTBFrRqkTpx0B23hc=
X-Received: by 2002:a05:701b:220f:b0:12b:ebc9:2464 with SMTP id a92af1059eb24-12bebc9260dmr174799c88.22.1775044232220;
        Wed, 01 Apr 2026 04:50:32 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm19200148c88.10.2026.04.01.04.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:50:31 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4] staging: sm750fb: constify fix_id array
Date: Wed,  1 Apr 2026 11:50:24 +0000
Message-Id: <20260401115024.89-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing 'const' qualifier to the static fix_id array to ensure
the pointer array itself is immutable.

Originally:
    static const char *fix_id[2];
The strings are constant, but the pointer array itself is writable.

With the change:
    static const char * const fix_id[2];
Both the strings and the pointer array are immutable, allowing the
compiler to treat the object as read-only.

Verified by inspecting the generated object file with 'nm':

    00000000000002b8 0000000000000010 r fix_id.3

The 'r' flag indicates the symbol is placed in a read-only section.

This does not change runtime behavior as fix_id is never modified.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

---
Changes in v4:
- Clarify const semantics of fix_id.
- Add compiler output showing symbol is read-only.
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9a42a08c8..f7b5b22f1 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -728,7 +728,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		lynx750_ext, NULL, vesa_modes,
 	};
 	int cdb[] = {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
-	static const char *fix_id[2] = {
+	static const char * const fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.34.1

