Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E18263C74
	for <linux-staging@lists.linux.dev>; Fri,  9 May 2025 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828730; cv=none; b=p5rvXoPloYkaoRqq/nFlBIWUtfR/SHEKNGG2GTPySH4v0mEflN7uMtsuBSLH3zjRYxQbcYo3oV4mAuChm95sJhNkFNFlPiMVPxwZpxjDIoBCK4iKdpagFvS5+sZS1eOa2lKzfwS0Xdy+6eAfafxNr1KuTikgzNqs1TJaZJAN5lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828730; c=relaxed/simple;
	bh=fSuOqRtt7ZYmppWs56p1+KFef8zOmvixULsapHDfrAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yt3bnKKyemEQmdgfIAYhIWTXZ00Kdx/+c9alAUVbA4AMQ1O1y/l1sKE1lQOT+mTw5LDYujgKOLHdmyq55GUkBK8G9R2uGEC5NdE2Ds9Eqlzu+eTlURhodr9Ip/MCH1oWJMU1DvAkUyU4fLbh+veqISHnYiGl3ZdwF+3PF6f98AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=e1seWQUn; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="e1seWQUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1746828723; x=1747433523; i=wahrenst@gmx.net;
	bh=5EtrrmzyVlgBlucIvgZuvoUn5ZcSDs6sEe0wxkObomc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e1seWQUnyKCnMYde9vL11R0tKVToQRCIKhel53jNXAhJggNzcGFAlBKf6pZ4GuXU
	 ZJYMHFD3ZWUAhj/xqeoGR0Fr/bS3wUH/174RTDoevkN5t7FBcL4hKXEBaa+cg4dvQ
	 g07/kWqrQdb0SPljj3j8fLruwWzNO9I5x0x5uUI4mztPDqiR4S7dlQpuz98SYEnQG
	 jSLI/1ddFG31iUQdGj4Z9O6qQ5wPtjQ13tZfqNAhtElxrn7+ImdsKDchx8aPD1tdz
	 ApXJBTMg50DEED5IpVJGJiFDxCRFndv7EZ6SQFEI/HymURGqF1aDPWX7tCiu8diKR
	 IliP2ai2658QJtRKpQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSbx3-1ubsJm1cWP-00I0mA; Sat, 10
 May 2025 00:12:03 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Phil Elwell <phil@raspberrypi.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC 0/2] staging: vchiq_arm: Improve documentation
Date: Sat, 10 May 2025 00:11:50 +0200
Message-Id: <20250509221152.13564-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BI7FgbP3HiBVikIEiwPrG6A9BO0N3z3lIftOvtZnyZAHICbncsd
 krh1QCXEsHVP2iOD5QRfY0IegmcjMmHnE5T+bY9vFpfIjJVHJfBMdRqjpaeIi0F5+tT50N9
 QFK6n2jPjJ3/h99R2QpNzFN9GSPZYqJmHSrOQ6n/ChjISf+HuFIzKckZESVwLK0RR48seXe
 jnmgTOCvEBbIQqsTGHw/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:y45M/Ms2/nE=;zr37LiP1rfEe1Ngk9+OIJvGyhWb
 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

This series addresses the TODO about vc04_services documentation.
The first patch provides some inline documentation and the second
document the IOCTL of the VCHIQ character device.

Phil Elwell (2):
  staging: vchiq_arm: Improve inline documentation
  staging: vc04_services: Document VCHIQ character device

 .../vc04_services/Documentation/vchiq-cdev    | 87 +++++++++++++++++++
 .../interface/vchiq_arm/vchiq_arm.c           |  8 +-
 .../interface/vchiq_arm/vchiq_core.h          | 56 +++++++++++-
 3 files changed, 147 insertions(+), 4 deletions(-)
 create mode 100644 drivers/staging/vc04_services/Documentation/vchiq-cdev

=2D-=20
2.34.1

