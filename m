Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850E017757
	for <linux-staging@lists.linux.dev>; Tue, 27 Jun 2023 10:30:18 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id CA37D186675E;
	Tue, 27 Jun 2023 13:23:46 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id i0vgddjJrO1C; Tue, 27 Jun 2023 13:23:46 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 7DF631865F57;
	Tue, 27 Jun 2023 13:23:46 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dqY1wNlJLr1V; Tue, 27 Jun 2023 13:23:46 +0300 (MSK)
Received: from anastasia-huawei.. (unknown [89.222.134.55])
	by mail.astralinux.ru (Postfix) with ESMTPSA id 683C71865B39;
	Tue, 27 Jun 2023 13:23:44 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Xiaomeng Tong <xiam0nd.tong@gmail.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10 0/1] media: atomisp: fix "variable dereferenced before check 'asd'"
Date: Tue, 27 Jun 2023 13:23:33 +0300
Message-Id: <20230627102334.18781-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The variable 'asd', which may be NULL, is dereferenced before
check. The problem has been fixed by the following patch=20
which can be cleanly applied to the 5.10 branch.=20

Found by Linux Verification Center (linuxtesting.org) with SVACE.
