Received: from MTA-08-4.privateemail.com (mta-08-4.privateemail.com [198.54.122.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB93032E741
	for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.122.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761049060; cv=none; b=kV7V5JYkEbTVselZ9jSmVwS29cMicYaqEmebZrJ4av7Uk+krtA7zoiPGgBiytQg67Ic7wAaE8FLjhwznnjslSVZ0JUoa2fWBzGECXTf/2BJBECxFKSwGyaip5TC2B/YBHDvJQxeccDE++dnvALDclbx2CCvHMgLkk0HRmW/dJPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761049060; c=relaxed/simple;
	bh=EQ2mAkbfUcR1AbZvzRKx7HHNMZ/kBLbls2HmoypncFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtpXAFXl+n46mMzgFhpJA4vHe/eNW5gAfoI14AuzSgDPF3L7BpnnSkyuJYqfmtmHXi9rW7cWXJJvJYS8h7PLTTd1RtWXZvQcbjb76mCcsvk4gyt/aJxoAnQZcl4wrztxyl92E0ssaMHRrmGNsZ3jaU4Bp3rHd+qlhkus0eOTnZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lukowski.dev; spf=pass smtp.mailfrom=lukowski.dev; dkim=pass (2048-bit key) header.d=lukowski.dev header.i=@lukowski.dev header.b=LqyQMGdK; arc=none smtp.client-ip=198.54.122.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lukowski.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lukowski.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lukowski.dev header.i=@lukowski.dev header.b="LqyQMGdK"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lukowski.dev;
	s=default; t=1761049053;
	bh=EQ2mAkbfUcR1AbZvzRKx7HHNMZ/kBLbls2HmoypncFU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LqyQMGdKz6c84oIYELA+k5M6blxFQ64M3+/kzI/+mTvf1NlbLrQbW5T1iaom48Qf3
	 4BHBgSf2wuSqISCHTUqeJwBr7CFtnycib+Xk4V3s/IR0bDHtp+lQGaNFdNrnAm0vQX
	 vHWojL92vSQ1MgBjFHhSCdzG1gd1L6vSd4BAvit8Dzf3zw8dkQY9MCIcCby8VxoM7R
	 ANK7jz6HR7RzTwK0IA82a8ket/7qdM024QL4OBDe+f5VnzhSRrsNzIR9GHvBqq/jFn
	 XvzQhpLrdogAupRZVhH9TcjrjK+eMNvsSysKLztKvZrL99V9TKg1qe37g0P13dTBFP
	 KhjHk1pyqxEgg==
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
	by mta-08.privateemail.com (Postfix) with ESMTP id 4crWWx5KJ2z3hhTc;
	Tue, 21 Oct 2025 08:17:33 -0400 (EDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (unknown [150.228.61.72])
	by mta-08.privateemail.com (Postfix) with ESMTPA;
	Tue, 21 Oct 2025 08:17:25 -0400 (EDT)
From: Olle Lukowski <olle@lukowski.dev>
Date: Tue, 21 Oct 2025 15:16:29 +0300
Subject: [PATCH 3/3] staging: most: video: replace BUG_ON() with
 WARN_ON_ONCE()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-staging-most-warn-v1-3-4cdd3745bbdc@lukowski.dev>
References: <20251021-staging-most-warn-v1-0-4cdd3745bbdc@lukowski.dev>
In-Reply-To: <20251021-staging-most-warn-v1-0-4cdd3745bbdc@lukowski.dev>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Christian Gromm <christian.gromm@microchip.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Olle Lukowski <olle@lukowski.dev>
X-Mailer: b4 0.14.3
X-Virus-Scanned: ClamAV using ClamSMTP

Replace a BUG_ON() call with WARN_ON_ONCE() to prevent an unnecessary
kernel panic.

Signed-off-by: Olle Lukowski <olle@lukowski.dev>
---
 drivers/staging/most/video/video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 32f71d9a9..3a622bd59 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -575,7 +575,7 @@ static void __exit comp_exit(void)
 
 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
+	WARN_ON_ONCE(!list_empty(&video_devices));
 }
 
 module_init(comp_init);

-- 
2.51.1

