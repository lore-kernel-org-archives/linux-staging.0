Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03F61624CC
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178348; cv=none; b=YNu3XFPNn2udkHZ1aQF0mS3h996DiBQxOoHhieJC1fYfCQiqdaAbGspZssLQD2cCs1yPaLryiX4aMcDwNB0f0/XxjqpDDWscHaO39w9sz9mp31CfJcw2dmxph+hhg/j6FohNwY99il+pDw0zUXqBqtZzaJ4ijynskxApYn6z0+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178348; c=relaxed/simple;
	bh=+cRpAGM3fBSnidM+4UWtJo8NX/FmO/Jetdwd/Ccs45w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pq2MBMzYe49GTUKYJqGxMoOD0rPaS/dSZaWl2rRBeekNMAl1RLOUMzJpX1tU54zkEmInusLwFTORN3v5GXDHnVR24HurC/lT/Tqqgfv3v069tyQ8p64g5z4WoZB4YHN48zisI5bk1ywQ5QggJLAvP8tdImJrYITOyJ1BPMN6qs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=P/4EhU7s; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="P/4EhU7s"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-aee773df955so293254a12.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178346; x=1744783146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rmpbl1qlaeHgafl2pHHR6F4mf7sKmkMLj4mHyYrbXzc=;
        b=P/4EhU7sD1T57hjLncywpOtbS24iN6YMLlbWnBimSThQWjrWHVOQWUd/77WYuy20so
         QIgctiLTR8PEMzYPIOPvmRvOMy/D4vTbBE5261WCyOaPyO8ZGN+FvrVCCcmklFzRYptJ
         RKIsHNA651YBxiNuvKlzESZFE+dSs3oBaYOaME29zf2SpCOgvnt4nYOn8v5ST3n6KKeg
         l2XQr40QDzg/X75Ze282GLAIvDgGxYrk0/0scJjpvzjffe0rcfjFO/k2jZx7vuufR8Y0
         iSN7bPpc2UCTX4MuI3hx3cWQXME9fTorUkX0uU7Gzg40ZZgHsRKauyrFb/LwAIyXSy2c
         9XrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178346; x=1744783146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmpbl1qlaeHgafl2pHHR6F4mf7sKmkMLj4mHyYrbXzc=;
        b=ZcMrtmPfPVpprYXujxU68Po1TDmQW8Ln6t7rGJpZUUrtpNnyd+oQJQkKyWikO+JfD9
         3rRV3ssLhBDVnIjw5NY5g3cPCa8ww2cnLDh1CA9+5l0g9utg+0mR6ndmhBz0m2fdhnh4
         cHoktoEOFy48ybNyaTOQIfdiwSE85lvjJqdptu1rJXzLCkH/UB/noMo/haEuqcWQ2CYv
         oehJPhcNYGuLSxE/EKV3VhQwTDxZg84Nd8yE7W1pcbFt9fnBvHW3PmSpkAQ/1ysCEE41
         greIvEpd6lYbvLF8N5sDZLaMTVY+ky8JC3xWVC98c6D782ZBg9MeMoc5KeUm1lAPaxdj
         HPxA==
X-Gm-Message-State: AOJu0YxrHYu/Wz/h6105q0i9bK5Xz9i49Z4BgCZiJmRLFldi055v/ZZ7
	OABPpK9TUfDU721HFmC9JtxktEcuuC0onpuKiCixb1l28RQA3puibeLMWGa27w==
X-Gm-Gg: ASbGncuKHVNrCQw8sqiEXEcm0WYNRb2RaL2/4VLfU94LMjpMFzJJsWlOpxOZ3CBLvOg
	UgUwgut9Nc3Fg2OfF2a7b/TyBnd5oYASBmVCxxrv2dBYy3u1WKkGNP41J8pQb1HgS9Bg8C9QIKM
	OUkgiOYmGS5Lbv/hdI+k8QnAFwmkVmVQ8RPa9IQtfnQxstpV1Ym9Do/idxUtTiWYXkeejCDFUT7
	n+M35GRuWQyo5ZHwt/cQo4OitH0pXbqaP+FrhSI0xaixc0CqmwukLruv/enHL5CSy+0e0Tpxmx4
	h7Da6cXjJZKoqmB1fJZjJ7zpsBL9/RzcdhAzo2jka5xaeeASJV1BfB/bzFIN1PoRWVUPXEJBmDd
	GA2jzYg==
X-Google-Smtp-Source: AGHT+IFMwN3VRVu6sqrMT03lTtDFVvGqXCWf8R+uS7U2w+zhQwb7/rYF7s9d85IQM1pcKBVZHUeNxQ==
X-Received: by 2002:a17:903:2a8f:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22ab5df1b0dmr85399485ad.4.1744178346023;
        Tue, 08 Apr 2025 22:59:06 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5458sm3343055ad.200.2025.04.08.22.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:05 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 00/21] staging: gpib: Removing typedefs for ioctl API
Date: Wed,  9 Apr 2025 05:58:42 +0000
Message-ID: <20250409055903.321438-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving typedefs to explicit structs as dictated by the Linux code style.
Also removing typedefs for fundamental types as per Linux code style.

Reported by checkpatch.pl

* Patch 1 - Patch 16: Removes typedef for explicit structs.

	In general, a pointer, or a struct that has elements that can
	reasonably be directly accessed should never be a typedef.

* Patch 17 - Patch 21

	Removing typedefs of fundamental types

Michael Rubin (21):
  staging: gpib: Using struct gpib_board_type_ioctl
  staging: gpib: Using struct gpib_read_write_ioctl
  staging: gpib: Using struct gpib_open_dev_ioctl
  staging: gpib: Using struct gpib_close_dev_ioctl
  staging: gpib: Using struct gpib_serial_poll_ioctl
  staging: gpib: Using struct gpib_eos_ioctl
  staging: gpib: Using struct gpib_wait_ioctl
  staging: gpib: Using struct gpib_online_ioctl
  staging: gpib: Using struct gpib_spoll_bytes_ioctl
  staging: gpib: Using struct gpib_board_info_ioctl
  staging: gpib: Using struct gpib_select_pci_ioctl
  staging: gpib: Using struct gpib_ppoll_config_ioctl`
  staging: gpib: Using struct gpib_pad_ioctl
  staging: gpib: Using struct gpib_sad_ioctl
  staging: gpib: Using gpib_select_device_path_ioctl
  staging: gpib: Using struct gpib_request_service2
  staging: gpib: event_ioctl_t now short
  staging: gpib: rsc_ioctl_t now int
  staging: gpib: t1_delay_ioctl_t now unsigned int
  staging: gpib: autospoll_ioctl_t now short
  staging: gpib: local_ppoll_mode_ioctl_t now short

 drivers/staging/gpib/common/gpib_os.c  |  58 ++++++------
 drivers/staging/gpib/uapi/gpib_ioctl.h | 118 ++++++++++++-------------
 2 files changed, 86 insertions(+), 90 deletions(-)

-- 
2.43.0

