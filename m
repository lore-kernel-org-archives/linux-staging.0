Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963DB653
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187531; cv=none; b=rrkgh/a2SGPVnt7qUrgO1x+ZZFgJaFM7dWhYRInR1fDE7pWQoFVPP5GCuHpNGBzYrK4aemr6vCPZ5S6W1sWi1oy3JgIrmnU9dDyYmIPUfKKkQJ/p42YlQ96H53lqsd6rrC3E+7Z5DoFnRVP5vGhfKh2p7lprSYEPNHzrU/ym36k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187531; c=relaxed/simple;
	bh=03TnVV3ZTgJ1suUanXy44VUBp09Y8s+OqB7eca0mVRU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VPivQQRYeMoBZTeOIRFHs0/zRrhc0h3cAWsfFtf/NU9X8Wy3EksAv5ZA7tLG+MKNDHdMQrTnFvERnetwfpmvGS/YWVH2mj503zekE5sriKbpMgp1sUc7zs01MnyyrmfGxecbzefbnoe4+Gr9e9AO2V/vl1XJJuyRpMZ2fd3EX3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=cSSUSAHc; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="cSSUSAHc"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48D0W2P802033003, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726187523; bh=03TnVV3ZTgJ1suUanXy44VUBp09Y8s+OqB7eca0mVRU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=cSSUSAHc2NbNZfsiw+LRWo1aMLjYzO2Na+aKfRFWQVyAJOlGHtC8dbV9UzVREEq5E
	 XNwI6lkmxrjG76ErTRjjyAHZoAIeh6HSRBWKKdYhv8o1nIVXILPqnwgxX4Peo/gzky
	 Km0oYA4qgaAjlME1bKWLJBp4bWeckA/mv/zOgygUxXvzbMhGDx/pWZIqRDq8CnZyhM
	 BXsVcq6jaW6qwt/hZX2Ubs+oy8ZIUz6wtkcybACtZnmmpYiA7/IfNuCDG7ciFQ3qPl
	 wIdsfGhEctBObx8TDm8a/HHw3FL46Ve+IsyH8jEPB88RRGfPOQQOxVOXvj7TJpopuP
	 xGxu4RzLbg18Q==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48D0W2P802033003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 08:32:02 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 08:32:03 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 13 Sep 2024 08:32:03 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Fri, 13 Sep 2024 08:32:03 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: RE: [PATCH 0/4] staging: fix warning of -Wunused-but-set-variable reported by clang
Thread-Topic: [PATCH 0/4] staging: fix warning of -Wunused-but-set-variable
 reported by clang
Thread-Index: AQHbBUsy5+6RuZ5bGkKt0gSx4puwsLJU3bBg
Date: Fri, 13 Sep 2024 00:32:03 +0000
Message-ID: <83952bee2cad473386bed2d5c486a991@realtek.com>
References: <20240912022522.10715-1-pkshih@realtek.com>
 <6ca0e9b3-108a-4c1c-bfd6-1307bfe31e24@gmail.com>
In-Reply-To: <6ca0e9b3-108a-4c1c-bfd6-1307bfe31e24@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

PiANCj4gSSBjYW5ub3QgYXBwbHkgeW91ciAybmQgcGF0Y2guIFBsZWFzZSBjb25zaWRlciB0byBy
ZWJhc2UuDQo+IA0KDQpSZWJhc2VkIG9uIHRvcCBvZiBzdGFnaW5nIHRyZWUgYnkgdjIgWzFdLiBU
aGFua3MuIA0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtc3RhZ2luZy8yMDI0
MDkxMzAwMjgxNS41MTQ5LTEtcGtzaGloQHJlYWx0ZWsuY29tL1QvI3QNCg0K
