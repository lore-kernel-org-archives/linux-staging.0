Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13BD2076C8
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077340; cv=none; b=ZcFJu2KE4As/lksl/8hYP++txHtj7/Cy3ZkwlO8EZ0+Joe/Lfb6F6mc8Bih+LW49X8uiINX3RTBkeGBCk9CwxgFNPoml1dMDcDdsbMJKXVQoLkQPOtO0WPTEj07j6HSMlweZUGeF3cuMRjxi8G2riq/hjZWVfht1ozvKRke8O14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077340; c=relaxed/simple;
	bh=/dXJMVCeqc+QvVALM/tWH1cxR+lJlgyToQufq0xFUVk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z7EAbA+2Tx3Z1gx5xxCBlI5yN278dBn68V2RQ67DyKWOKkkFtmN8T/Zap1j4lFIRJNevowf2yvBca392AV77rZBtdPPgCf/4BeDzklmH3F9Gda9iMpGGYJT9PeO8rZsOzYw7qEZzTdhRqUIEvVJ8SmWsXptvzbyhBAoRoX33Ruc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhdywTA8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhdywTA8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1851C4CEC5;
	Wed, 16 Oct 2024 11:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729077339;
	bh=/dXJMVCeqc+QvVALM/tWH1cxR+lJlgyToQufq0xFUVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jhdywTA8LcKBoZBRktQ1QU0xQixrB3P5BYFHUnWZdvtvWqiMycWNcsdI7uPx7TwWu
	 nPk3pp+j7rDOa9udcfMozz5CCxXV1LLxsueC1eQ/RHz3oAYupHwhA4sUDDXUBcNqGZ
	 wA/AOzfeMXEhLY6Nj3+WWLALShRXAUcmW3jVEL0roiF9vR4PyYKIQSnzcyx+IClWbR
	 f2iggQ2itgcwG5PA+v0LmrzB1wWC4MBImJ6+ZVJcji0+fak5fo0z6gkHCjddlfREc7
	 VbFzZzMhoFChSvqM4c9rQdD76jSMCAa+7YLxtTA42NCthfWfNWseY9M8fBwwoPvnqs
	 7ACDWLvoXtJjQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 7/7] staging: gpib: cb7210: select NEC7210 library
Date: Wed, 16 Oct 2024 11:15:21 +0000
Message-Id: <20241016111521.1143191-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016111521.1143191-1-arnd@kernel.org>
References: <20241016111521.1143191-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The nec7210 library module is required to build cb7210:

ERROR: modpost: "nec7210_write" [drivers/staging/gpib/cb7210/cb7210.ko] undefined!
ERROR: modpost: "nec7210_read" [drivers/staging/gpib/cb7210/cb7210.ko] undefined!
ERROR: modpost: "nec7210_command" [drivers/staging/gpib/cb7210/cb7210.ko] undefined!
ERROR: modpost: "nec7210_take_control" [drivers/staging/gpib/cb7210/cb7210.ko] undefined!

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/gpib/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index 8c550f669958..60743200a0de 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -96,6 +96,7 @@ config GPIB_CB7210
 	depends on HAS_IOPORT
 	depends on ISA_BUS || PCI || PCMCIA
        select GPIB_COMMON
+	select GPIB_NEC7210
        help
        Enable support for Measurement Computing (Computer Boards):
        CPCI_GPIB, ISA-GPIB, ISA-GPIB/LC, PCI-GPIB/1M, PCI-GPIB/300K and
-- 
2.39.5

