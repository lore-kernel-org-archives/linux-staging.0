Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E689020CCF9
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728640897; cv=none; b=t2oBllfSiLlcH128X675qtxgiB8BPijFc5LnaEMChEAC+0jFojEwVXHtAQN+yAGZKM94IjiR5Xsj6J3/1yVEG4jl4juZ4nGWNH1a2IsWvEo7zFD14KpVe90t9e7gHFIGCA6f73pMgoV0jfe3jljtuqZx1LKVXIHt4pa4EGe0Flc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728640897; c=relaxed/simple;
	bh=ihb8TR/kCjXUxiJV60WlXuvVM95R3N/aRpyuDR7K0YY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rlMfB0ZDmsITU1dE859AncX+qLnSd38Tf9SYMMDH6TdnYYhpA2twqUpc9gP4jJVzvvD3JoWDKg2aBumrKCgKqGofgrCUqPw0n6JSBmY8cj6x90aUyytCrcZZfLVCZIIAGgdvFYL8lbW4wiWEWWbl4m5rc4BWtM0ac5yhU3ji5mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=YNDxJmjG; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="YNDxJmjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1728640884; x=1729245684; i=wahrenst@gmx.net;
	bh=TZMw7lhv7d9+ZUqFl46/3VLd/GXuZ1jfeV93cA5HWtQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YNDxJmjGHy17eUWb5s2lJDvdGxXtkqbT6Z/lB6ctkmFKglvkY5WxLOC0fWoPt+XO
	 m1DCXfN+DZ8NeZ8kvkKuCyshdSygc1WUAYe33D8+i/lO0r2zrnW59U6JGIRCaTbnD
	 5DlxCMEeWXlgpYmVOmuc9OtACqHF9tIsRhihkPjwYjzxWc6Bxh9rC65CuBMzXusA4
	 wP/lNm77WYM15eoNSyO3L5NXGm06nc14N+rRGgjn9lkNZ/70BwZu44AjeHY1A6H4m
	 tluvNEryRVrABfHWtFUeMj2ttG2VFjvzntctn3pAll0ovsEDsXQd0ciynWOR99bBI
	 G96X4Euihr+q98Lu2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8XPt-1u3DCX2cQT-011RL6; Fri, 11
 Oct 2024 12:01:24 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Umang Jain <umang.jain@ideasonboard.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] staging: vc04_services: TESTING: Adjust ping test
Date: Fri, 11 Oct 2024 12:01:19 +0200
Message-Id: <20241011100119.111399-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jNEtSQnOX2GBrk7kf6SO5474fmxepl5qnm9M7scCRepS0kC9TVc
 704xGxqH7NI/o7LOVxY+1dFUKtZWELiPXWNPRpNS+t8EzU11w5RdkqCxAPY9oZ8ZkYcS1wE
 Ld8Lklg5ZW6xjYBDr36wj5YWiUfnKIntZat84aLZnbyWldrCLpjJtPIkCgKHSxbkjxu/6ct
 v+7NOyWthq9XK3SMoO0AA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4fAhJBUQUEo=;1VbMX6GRCTQsFJgHXi8rkERsCL6
 Ws/bCeNbLt8u0sxUJSXfkjzWtVr1aO/DkmqKgU8bH04BZi40p2yQoCoalmythSjpMRZI04zIv
 cgdBlqfg8oMwbsyJzn0PNwbMaQVC6vcFDuJQ+nVu0SuwDB759evxZHP58LUKYGAIhqhN3oNhy
 vp8vM5Sab0Emqgg6/k6VMQe54kHDiXTyA/9GafFCu462Md1VcvXObbYB4qopSK2g0q8CbBUz9
 qcSyfjaO1pweDH3z1fyUhcnCisA8xSOTjW+d6KJt8yD2VMlAiV49bx8CkEaNOPimqKubR2Fib
 nPb2J8jU9NiWyPvgS0onaiz1qIghzlAqqr9gRN/hRcpVJadFGtWmbzNE6ipv/RmtQ97Cwnwuq
 DhvrDwfqWlptd+SOH5/xal22ZoQ8RpcroNg0AD1yiUD69OswdTc7m5uJX6ERY4G55BAOFKMkW
 QNcP2IeOhTRqy0Xgfz3LVDgUD5kVk54n4fBHlCQORPHnbAbXDPlkbZ52lJVXBErVrtoW9tEek
 lzd3hWhUSHHSDrMf6OtUgmqsjptkSI1m+6XSh506EJ1+s225fgqzul1ClqfF6QHkSbpTAJ3ps
 O5bJ5CQqHrfaOTAaG8yiWEaWVBPVrqpDU3KNhNOj4AyN/8EHjAgDR2m+lVmyw9k/VpEKkLNl+
 NDO+S9ZLRDeyKO2h68Q5lI8SdhvvPYunk0ILTrDe9671CcIyys4CavUG2SUKaPt69uA1AICaE
 Mfo9o4oFNAH1euW8s16YBMYFheSm/lzmCo3nxximTV7ue77xxsAXPPiTqtomXqr0QwdvVL1Lu
 59b8gGW6d2xI0DHKgJ5z7YpQ==

Recent tests on Raspberry Pi 3 B Plus have shown that one
iteration is not enough to discover issues reliable. So
switch back to the defaults (1000 iterations).

Link: https://lore.kernel.org/linux-staging/c7e302b6-fc62-4754-ab1d-7c2771=
cccf60@gmx.net/
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/TESTING | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TESTING b/drivers/sta=
ging/vc04_services/interface/TESTING
index 273952dc9d85..c98f688b07e0 100644
=2D-- a/drivers/staging/vc04_services/interface/TESTING
+++ b/drivers/staging/vc04_services/interface/TESTING
@@ -52,10 +52,10 @@ Here are the most common kernel configurations:

  * Ping test

-   Command: vchiq_test -p 1
+   Command: vchiq_test -p

    Expected output:
-   Ping test - service:echo, iters:1, version 3
+   Ping test - service:echo, iters:1000, version 3
    vchi ping (size 0) -> 57.000000us
    vchi ping (size 0, 0 async, 0 oneway) -> 122.000000us
    vchi bulk (size 0, 0 async, 0 oneway) -> 546.000000us
=2D-
2.34.1

