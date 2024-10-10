Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AA81BDAB8
	for <linux-staging@lists.linux.dev>; Thu, 10 Oct 2024 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728555806; cv=none; b=GZAxOvZrWaYezTOvAHv63f8zkEIxWl0/9rz/6W69DAGZFvcKkzVH1VKR8U7Pxq/iraV1aqbbWe9oapc73QCIfvMAn6U8gJYGY3Hyg9OIodwBct7oOzDQ3GhKP1TmJ5fbWxfsMSILDgb/mEzBXozIWcIWBhjz1M+VTRi7++TTdf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728555806; c=relaxed/simple;
	bh=BTBxOvVuTM6WsUy711z6oEamya74MHIMHKK3ovmyR4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7XdBzKRt4HuTkspW+tSIXtpssFI8diR6n8kiM+NFQ9ld6x0mEnM5ip612RHQAgP3rLvTxcVxfmU2542D4mLrOjCZuN/gUHanznCCdkqS0HRCo1MF1qM90LKNw83GwAyVhSfu8CL5sRKRNakwqcIZbgk5JTpJaouZAPOb0OF+uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ijTxbKUf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ijTxbKUf"
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D6BF4D4;
	Thu, 10 Oct 2024 12:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728555698;
	bh=BTBxOvVuTM6WsUy711z6oEamya74MHIMHKK3ovmyR4U=;
	h=From:To:Cc:Subject:Date:From;
	b=ijTxbKUfolk9+TdYDRxKJfqsraL6NR9T44Q50tG6RBqO90JJXEG8oqaVAXlyqE4hH
	 5N0hbGmXngsuaNBkppBnVrD+obRaIAGNExoJrS8QFgTTgqBVnJIkAcAFWqS41QzxLe
	 0dD7I3zz6R7F5NcR/MFysQGwemEbROBxSILsI3Tg=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/5] staging: vchiq_core: Improve indentation
Date: Thu, 10 Oct 2024 15:52:44 +0530
Message-ID: <20241010102250.236545-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small self-contained series to improve indentation on vchiq_core.c.
Mostly addressed by reflowing code long lines under 80 columns to adhere
to coding style guidelines.

The dev_dbg() statements are left untouched. Followed the principle
mentioned in the guidelines as:

```
However, never break user-visible strings such as printk messages,
because that breaks the ability to grep for them.
```


Hridesh MG (1):
  staging: vchiq_core: Fix white space indentation error

Umang Jain (4):
  staging: vchiq_core: Indent static_assert on single line
  staging: vchiq_core: Reflow long lines to 80 columns
  staging: vchiq_core: Macros indentation fix
  staging: vchiq_core: Locally cache cache_line_size information

 .../interface/vchiq_arm/vchiq_core.c          | 317 +++++++++++-------
 1 file changed, 194 insertions(+), 123 deletions(-)

-- 
2.45.2

