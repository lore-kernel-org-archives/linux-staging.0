Received: from out-2z4y-a145.jellyfish.systems (out-2z4y-a145.jellyfish.systems [198.54.127.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F1F44D697
	for <linux-staging@lists.linux.dev>; Sun,  4 Oct 2026 21:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791148100; cv=none; b=I35B0rsprT/UgLsT9J8/qxET1f7OixL9az01pSGpbo8+xEPgUcA9VB7ckpBcIuR2EbVLLrtl1Iu4N7ukVdMXdtmtf6/EBAgeYmnZa/v5WOZVt/OjKm2rrxZ7icgpZIij7mtqsMeQNRa4xKJhwxdU74ilp492wXW0vgGCdTytE7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791148100; c=relaxed/simple;
	bh=lKqfRHN/A2qQhJm+vzgWtlyumbcMBD4PpqjWW0zJLRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6RhCfzy8QlxmU4dIqxmuOo2gRYAIuNM2ULgNuKK76SHgJHkZdyC0tWZE0yrthyQOVfsKv3La+RrNR3J7zUoX2UiThyZUvVdzTSDjZPRp9VYsv67d60vi4WPQywzGABjUUMuOW6mNhq+xRRYsyRAyhuiQYviyFIBV5FNP+MW4FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org; spf=pass smtp.mailfrom=firmwaredesign.org; dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b=Fn5K+bJm; arc=none smtp.client-ip=198.54.127.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b="Fn5K+bJm"
Received: from mail.privateemail.com (unknown [98.240.242.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hyZMC5Pstz8sWQ;
	Sun, 04 Oct 2026 20:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=firmwaredesign.org;
	s=privateemail; t=1791146824;
	bh=lKqfRHN/A2qQhJm+vzgWtlyumbcMBD4PpqjWW0zJLRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fn5K+bJmTu2T108hfG5SXpuTssMP0H8Q7k0sKXk7pQkK9y+ipF2i7jan4PNGvLX12
	 cWW27GLMdwe2ztHzdDmOlXeBb4hK1nsQK1AnV5Nc0P2PnjZVFsiF+Q23DsHvnHDor3
	 X7zxCu8Ue7mRydDEnaokLVRUS24JKJgtCy7v8ae5QwJGW5uC+KhgWl/TkS9JrcYpgE
	 jEvdFwLLxIIKtTqC8eqZmMbGzm0pmkIbPsIZhWgeFPAwYFFK0SWV8V9XwbuY/gWWeB
	 e6CpjN1UxLlAGxC455t5AsXv5FVmH/Jm5ZRHndnDcks3oJwgWBe/n8EavJIbPFAkvO
	 MhFAv1Nmet5pQ==
From: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	marinela.selseth@firmwaredesign.org
Subject: Re: [PATCH] staging: rtl8723bs: remove dead antenna diversity infrastructure (FAT/SWAT)
Date: Sun,  4 Oct 2026 15:46:54 -0500
Message-ID: <20261004204654.5153-1-marinela.selseth@firmwaredesign.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026100304-entomb-collector-9004@gregkh>
References: <2026100304-entomb-collector-9004@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: marinela.selseth@firmwaredesign.org

Hi Greg,

Thank you for the review.

Regarding the "deep analysis" phrasing: I apologize for the loose and
exaggerated wording in the description. For this cleanup, I did manual
code tracking via grep to isolate the unwritten members.
I will simplify this wording in a v2 commit.

Regarding testing on real hardware to see if the rtw_read32() dummy
read can be dropped: I do not have access to a physical RTL8723BS
SDIO card on my local architecture. This commit has been verified
through static source exploration and compilation checks only.

Because clearing low-level register reads without an active hardware
test loop risks breaking chip initialization timing or clearing
hardware latch states, I opted to preserve the dummy read out of an
abundance of caution for stability.

In case someone in the community with access to the real hardware is
able to test dropping this register read, I can then remove the line,
or they can.

Best regards,
Marinela Selseth
