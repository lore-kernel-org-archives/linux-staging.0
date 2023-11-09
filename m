Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B25D2EE
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 7366918652F9;
	Thu,  9 Nov 2023 18:00:41 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id YpPGjExAS4yP; Thu,  9 Nov 2023 18:00:41 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 1C7E518633F8;
	Thu,  9 Nov 2023 18:00:41 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ASjcS8G33HKl; Thu,  9 Nov 2023 18:00:41 +0300 (MSK)
Received: from rbta-msk-lt-106062.astralinux.ru (unknown [10.177.14.192])
	by mail.astralinux.ru (Postfix) with ESMTPSA id 91241186505E;
	Thu,  9 Nov 2023 18:00:39 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: stable@vger.kernel.org,
	"Greg Kroah-Hartman ." <gregkh@linuxfoundation.org>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	lvc-project@linuxtesting.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.10/5.15 0/1] media: atomisp: add error checking to atomisp_create_pipes_stream()
Date: Thu,  9 Nov 2023 18:00:00 +0300
Message-Id: <20231109150001.22891-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

atomisp_create_pipes_stream does not handle errors in
__create_pipes and __create_streams in versions 5.10
and 5.15. The following patch may fix it.

Found by Linux Verification Center (linuxtesting.org) with Svace.
