Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCE31D61B9
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741524630; cv=none; b=eQhBQV5lZ4DuZHHcr2mZbYOb6b6XHRv3pvYVyMuq+uQ8VXKVL6cdkkP/Pq9vyCybCbrEGYh0TQnnWFo1x4y/Y5nVH6QmECejq5p5sUdpBL1xs6ai8c14IUQ1Pgr0lTEVdSDZmu+XuXa7WXUccQGfURJHhRX8B44XY/DwqSfWaRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741524630; c=relaxed/simple;
	bh=9qyVUMgHyvBkSaU5rZ5eEyzeksQGec5p54t38wUZWyw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NcGOz4tJMgwOO3sJWxrGo+Ja+Xkh7jVZLI18jsJnzfV04U3E+aCipkTQk6ow5ijHpR5KWLiNjVBuDRN5O8ZzjQZUk9B5vXEX38faRIN7bzfusgY8uFdSfyMNwYDy0ZlWEoqXj6HyeoyB4BM7KJK5Rx9jXgykfljDuwUlqhzbw6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=lRZrm5Ad; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="lRZrm5Ad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1741524619; x=1742129419; i=wahrenst@gmx.net;
	bh=pLb8CZ/yCsK0onb7oAbrJ7xNsSeNVG+Pj2jfFRdvfzU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lRZrm5Ad2wIVbJ2AsuDrIws9O0ImNKSytWYRRFa4knclT5E/jCqmRL9q9sK58O+g
	 O6rIeoGUFAmry2McYuo+lNZvqNuxran+O7xEGQm67Nn17bdp8AsC9crHirEYL/5cH
	 fTZMOh2SM03Yuar1zcAtULSOfIYkBjEKbLJ0YZZzX3zXNskX42l8VDGgUE8Ay+iE/
	 RKRHw5eyfOVhaoqVMcBSnQb4kFGIDye8a3fOFJLzcXW86uRXqTS9/5pi7XGkO6ObV
	 +8ZI4fE6DTtqWurj8/MPI8BkhcHKSXTk9vRyx0EpHTBO6yN7jtdOnAjBj2oixtv2p
	 TaqiCSvFx10SVmPbQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f5Z-1toDhc1UyN-005m9t; Sun, 09
 Mar 2025 13:50:19 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/5] staging: vchiq_arm: Fix & improve resource handling
Date: Sun,  9 Mar 2025 13:50:09 +0100
Message-Id: <20250309125014.37166-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p8fIGmiRZLax356bRabe21HXoRTe+69EeTlX8M64FZeUd+wEvWl
 PbgAZgqjeGm/iH9srgb0KpZe0mOT89WCOlhr7whqfUwfY2ND/E5Cz6y8acfN9cefza7/86Z
 MfLX+LQwHB1wTgyukvfablyRn1AdWwZ5QdMAaykery3EY6RvqAW9IJ1xNzQwQteDEdbOAr2
 yaq8lG+YNMqKEmYy+sc0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Xfq5icII74M=;VQaZ/ysS41AIf8FtPNB9BlP1pCy
 9/C88lHgIXDYuPBtONFwacPDZvNlJyEoAEpgUIdbIqsCSLiS4sOaxOdNwccLD+4ptFdk+3jl/
 uwN5Qvvy8HrWXnL1yhJFUs65gFk7fUkznD4YJ6p92xjX3aAabEXV5NearXIbyAtSzn15PgHKM
 n2z3XfmUG/texm4aXSsv+jhA/iOfRQA89hnP7kgPVIp8AIFpyG+uIL5EYsuoqVUBXEL9992gJ
 xCd9NtRAgv4Ppd5Dmyx6CAqqsKD432vfsOxsQxrUWVff5YqXQ0JhkkxZtYxF6lC/CBIcAfwW9
 qL7LJjBaREkt+CR+XX5Zeql2tq9glNOJ9yzNCzvPIO7z7D/jo+X5HvaZN39cSh4dC93n7k13L
 jczUYMIGAuEd0TBnHQJdoSPx+DsDdquMuumqvcbola5bRGFzMgHnTbZOv+Wt9BHcycz2FSnzd
 V5g8CN1nXxmn3cHGn9oUq/SxIxtG7/oUAt5mfuSoY3OpeKWpJFCkqUKUfGnbcnlECbo1Jyv1E
 I1yIKqtwSZ5ofIhQxqysg143H7tcMwXgK6kRLxobXtIQscbLMN/I5XmoXs/fotzZPA1IQCTs5
 UU2GzDVfz7h5yGGRk2UkLswIGenmVs2YutURmgMkR3OagzXaYdRBmJr9eAddX2wrKFlELUn78
 SQ3J12kKgfFkyXeXe6ebgzvQT8OFo/vm88UtwYtmCLvL8VO4MmMOX/do4Dnk0CRVq9z0Ve22w
 SyOS6L9oRXnqifij4grVm3AJH9cIGKnwT3ClW9DOb83CrjargqP49fsXGdYtA8sH8J+ke/sIQ
 YQthucr2kTeE0uo8CeLAX4HfXbSgahvIyJbGFP3MBMpF8Dkp85ftvCAQOjIxSaTHD5/7duapB
 ugqmTrlsP3hLR+YBmCHOGMFm7pp4m05Ox7+BFclasygvys5hgn6943kAb7z3WknItybzO+czG
 RF65wr6BUPM76uOPo2QLC0JCAdiJTGNSxwA1Dj0vUShcLgUMwdjspFZyKVB5bwmFG0ebaFXcV
 gfnkrVUS3HUhynAwn/CnYOueW5zLUU5Th7OzhWvz/CFfG1e4BAIMBC3NVarulphiK6g3VPyuE
 smesFTBz1OLtttMryREv3JTZc+moUhDhD0jGSSfUZqdjxa2VZY8eTk4LTuq7cNPyTjqV63tYI
 fJUpueI6UTatnOZ58thvgP5tyDE5CkmgpX3hZBKG6jrxzzHtYIETT6MbqNqtso8Qtne2Omlau
 4mthf/S/hsllDpeYffsC5p0vbtv6EoLnyD/AK8lhgJ37G9iDRmEroXpq0qfciAYlRj3wj//wW
 UdivT1ZGdVUgnjboLwoCuSGilNy65W5trO1UD9fIKi8TXeBChd4Nhe9qRzvdCnP0JUyOdxsTD
 JEmyPO8tKkD+uKyI4zPydJwszWRsX+x599AGPF9rjjn+EEYyk+4aBoFNcT

VCHIQ driver probe und remove have some resource release issues regarding
kthread and debugfs handling.

Stefan Wahren (5):
  staging: vchiq_arm: Register debugfs after cdev
  staging: vchiq_arm: Fix possible NPR of keep-alive thread
  staging: vchiq_arm: Stop kthreads if vchiq cdev register fails
  staging: vchiq_arm: Create keep-alive thread during probe
  staging: vchiq_arm: Improve initial VCHIQ connect

 .../interface/vchiq_arm/vchiq_arm.c           | 121 +++++++++---------
 .../interface/vchiq_arm/vchiq_core.c          |   1 +
 .../interface/vchiq_arm/vchiq_core.h          |   2 +
 3 files changed, 60 insertions(+), 64 deletions(-)

=2D-
2.34.1

