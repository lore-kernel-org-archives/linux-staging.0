Received: from outbound.ms.icloud.com (p-west3-cluster3-host3-snip4-10.eps.apple.com [57.103.72.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799562E36E2
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752866401; cv=none; b=lD1i1F4HU5iPVUlnyx1BcFDw5XhpkVc8iZK3wlw5q+P3jvqGGsKhZr0s/1Wx+z6IMOtfmd+XNnuh7XxPnXbSXE3ENQ7i2I2U/QO1rMehdqUb+cvhjfh9QFZmwwDACMQp9+74qT9DIobAhVnmzp9/IRlGP/GPcYlIQWmmYL/WgCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752866401; c=relaxed/simple;
	bh=1p56HXCGwCbFUVmdCZ1DgXHMEHTvbTmirTK1Ra+ZpZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYgsk8fmyXWtzq9U33MVZIeIinMWk8h6Ks8pIFBTPJ1TQTdKCqsGRG+XP5UqObnDpfGGP6EQpVK5o1ZXqbphm1ijKF6N6ztfHBnGFn2dXogzfwqqs6ELNoRmsQLXejL87uQ615z3qvU7l2H4bH6Xcpk3JgOFvgagGIZiZuAuDnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com; spf=pass smtp.mailfrom=mac.com; dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b=MRrd9pcZ; arc=none smtp.client-ip=57.103.72.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mac.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b="MRrd9pcZ"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPS id 2DB0118005AA;
	Fri, 18 Jul 2025 19:19:59 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai; bh=w8vczb6CimP3Tgvgz0YKnGimIjFZsgVcn7WqmEvwvyw=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=MRrd9pcZ2PLPGHSnfxtyGeeIHnywjxAACaKjbJ7BNuefnjDIKb4yfwb6qZl7+cTRbbWHL+9hSaawjNQ+tbCysbmcSmhX2zQZJDQhl4GbP9IM6h0gN9Rl9QQuw0XwsLFRkmIOrysSMyXh2zjGlVjD/Ur8fFTMHUS6u8TgKEdWZ2K8sRyhDdON8uZPH/KHmoBNPBuRJ7m2XoUdnoPik39KaMDdxBMZYZZvbmqObDL4jFCHVmm+4lwKbZTzRvqle82E90ysuzReCGs4Xj99u+OaitrA6kbRlhZiWCa+akTnq7j1tJeoC79wLl6ramGXHs7f/8evJR6Hz8AjGEM2i4ac8w==
Received: from localhost.localdomain (ms-asmtp-me-k8s.p00.prod.me.com [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPSA id 62DE41800597;
	Fri, 18 Jul 2025 19:19:58 +0000 (UTC)
From: Tony Bronzo <abronzo@mac.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Tony Bronzo <abronzo@mac.com>
Subject: [PATCH 0/1] Fix checkpatch ERRORS in fbtft.c
Date: Fri, 18 Jul 2025 15:19:34 -0400
Message-ID: <20250718191935.5918-1-abronzo@mac.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SFolSBjfi5BWPGis7_A4KPy6ysCiRmEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE1NCBTYWx0ZWRfX1AnKf1ZT5CM8
 Y1cDBjjJorTtPlx5rkUsmXsgY31cKSqkSX3SOyU4WpNAzIYa09mx7APAYU4gLVvBzRdmADaJLAM
 5YTDwG20c4xBKRAU2pVaVUjvGoLqBwSrYuS9jkFcyCtnGUPfMgn94gSVhsko1TqoxS3/Hu6x+/L
 CC3qZ5N10lFAmoTowwDFzb78OsbvQftYg1pABDFNJqtVz5PAHlJIzGaevRzUHsV335gwrnXByyy
 9zQ4IwZL2Rymugl8pF7FOJ8ZzKlQdU9gdoEd0d+M/L3pMKavPzNZq4VfKIBsVDHhs90Q4jMFY=
X-Proofpoint-ORIG-GUID: SFolSBjfi5BWPGis7_A4KPy6ysCiRmEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 clxscore=1011 phishscore=0 mlxlogscore=736 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2507180154

Hi,

This is my first kernel contribution. I chose a small clean-up patch to
ensure I understand the process. Please forgive any mistakes in the
submission process - I'm happy to fix anything I missed.

Tony Bronzo (1):
  staging: fbtft: fbtft-bus: replace blank modifier with identity()
    macro

 drivers/staging/fbtft/fbtft-bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0

