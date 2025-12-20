Received: from sender2-pp-o94.zoho.in (sender2-pp-o94.zoho.in [169.148.134.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F6F306B06
	for <linux-staging@lists.linux.dev>; Sat, 20 Dec 2025 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=169.148.134.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224566; cv=pass; b=RJWDG9Bt5B/vWxUqvLbKI3G9EZ537BXnyHfPIhdq7iWXe4EBt0fo7Dt81PLruPj9lz/0QhTonyp8/qO7RwFeocD6SAULrc8jsQPMdX3EG4BjDcTM8MP0UR1nFes8avKmbn6z5XFSJ+x8IWx0BiPaJpNFAlRau73Y+G4bQPP/pAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224566; c=relaxed/simple;
	bh=3cZmGHMWKcpONAzCGGHE/IkgIfLktJTShLZd3ccn4AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=In5t7vukvKgeds7EXi5M9GgfQa1V15M2UE8dI0EaGHjMSmgSObT3mr04qAP3n3C+JXxqZ0FZJifG5S/XZd6nSePY2uYk22NXazkrIHMrLHl7mS4GvaCCVYZrIMOeMwvWJWzaHBR7EDO8yaFYFjpELXxax4FtpoT9jOy7t2LSo+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b=Y5T0MFgC; arc=pass smtp.client-ip=169.148.134.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b="Y5T0MFgC"
ARC-Seal: i=1; a=rsa-sha256; t=1766224549; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=N+QHm1hq3qlbJPdaNPfUPW0eTqAvUaUwR4zSUIj/J/UYmiY3pCFBO6BS2h3A9FykhKt9S2ffhG5kUL/cByfruMF4kSDcbMG8T3kY7XjQ3q1UbupRSVL3mfJBgcHRP5MF5rJE9/7Y1AECd6w4lreAUfkCyQ9aLT979hOo9oabWRc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1766224549; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HNEgVc7rr8Q7TcigOKZZFJY0PJQw5EZtyXLA/KKyDBU=; 
	b=H+gCVx5kvpvTY2DC1koQMzoBVD6jtH2F51sva4udDvTmX9D+n9/nxs8bDaFEWgdNayJR+OqeZT8X3Ci5N15CRrqncjBj5SPLuZrykaoLDnWwp3eKOGu2k9uhFkNAQAHVuPhCgkPyH4rtwJc9U9KrhAu1MINmb36j2nFryxH+c3U=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=preyas17@zohomail.in;
	dmarc=pass header.from=<preyas17@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766224549;
	s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HNEgVc7rr8Q7TcigOKZZFJY0PJQw5EZtyXLA/KKyDBU=;
	b=Y5T0MFgCRIKpV0HCJHirO+42syGxgj9PB4ee/Ul8AOWsQhMnmb2YlLE+ERBVVDkv
	s2/3CwkLeg8ivTPYziMfQxIriWfzoUkGaXWm/TqqyWW9rfPHCsB411gglZzTjng2iru
	fBbXuHge3ZHDVRfJbysGeVkGU6fIPhtlfEEH1Z8A=
Received: by mx.zoho.in with SMTPS id 1766224547592834.3341855296335;
	Sat, 20 Dec 2025 15:25:47 +0530 (IST)
From: Preyas <preyas17@zohomail.in>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Preyas Sharma <preyas17@zohomail.in>
Subject: [PATCH 2/2] staging: media: av7110: fix checkpatch warning in sp8870.c
Date: Sat, 20 Dec 2025 09:55:21 +0000
Message-ID: <20251220095521.36992-4-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220095521.36992-1-preyas17@zohomail.in>
References: <20251220095521.36992-1-preyas17@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Preyas Sharma <preyas17@zohomail.in>

Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
---
 drivers/staging/media/av7110/sp8870.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 0c813860f5b2..93bf47a62e38 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -496,7 +496,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
 				dprintk("delay = %i usec\n", check_count * 10);
 				break;
 			}
-			udelay(10);
+			usleep_range(10, 20);
 		}
 		if (valid)
 			break;
-- 
2.43.0

