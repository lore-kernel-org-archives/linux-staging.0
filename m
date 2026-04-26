Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898D826159E
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 23:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245147; cv=none; b=ndmr5pl+ezkXiriSQ59qwVO7eODp33CrpB+SqXdAXOIR9kuOEUkHkJC1gdaerIQE4mApSXIV83WBWyenBP6lhuTRVcuqg1WO/F+2Ml07+jP+TWMHUELZgO1VNk900jzvEf9IJzgrfV0UvJ1Wjn1JojZ07HkCXpUokVVb6Kp7OvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245147; c=relaxed/simple;
	bh=vJyx4/r55UctGelMiEYqcTy9x/hNwse77hjwKq/rJcQ=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=RrSgOln5nSIDCBh9smTkflEzl/ZzH+0FqI8+4IqJnf8qpYy0YM9w/chbethX9/Zkm6QScn6BMgQS6NsAswr029dVWFm4gn1SoNB9604asz6kkQLFBfvWUYa5LlC6T8m5YlGjx3iznBVSucLs6rM1c1l06LqwmntgtrlYBNb36CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=kDLRl1cz; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="kDLRl1cz"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E592984E88;
	Mon, 27 Apr 2026 02:12:23 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777245144;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:  in-reply-to;
	bh=FYtL1aFYRY7ENepbxLKzH9p42WNA2KTd/3JCyjCv8AM=;
	b=kDLRl1czHeXS92iHVGnkOP+8slP2WqIqf7SWGY1sBExmUiPQBKqbyWP4Xe9lPO9Bg9iDmk
	d9Dil7t+Rn5wY/WuBlWZaeWb1yusCBF7jE91JyfSYgY5ExrDxSpSfbeCxMytYd+6BZ2vzP
	eYcbsUoqQzlXEqj6xFu8/W4Y588Hjx/gDyxI4Oy5ZrZhZ6LKd3qDgnh8/R2suuSxi0UaIz
	YgRJCy0JA0nqW+OspO33HPDdgNet8WaeDiwelIBEP8HIt5CixvJPIfLSWpVAg1+69JNPVi
	2R+PXXdscUOQKS1xew8zj6sibdMPTmQqabzG6wwF359W4zC0HCFuWs2oRtrEiUA7zMcgbp
	lpuS19XQniQ3/KBcgQOjhfwbVNwxDIwh14M4+jvJQF9jirHMT4jRfWhoTg4uZKhiMGKi64
	c7UiAjYUoCXoWhqoxwNhkgLMlGZ5CYEOeRTXimBpDOWhhz+nQk8q3pEnRmiqLp3iEfE9+j
	diw/+sUiu9LJM+vg0gWGoc52QzLCmXXGKtCFZ4k6bN5VBthHHLpKDEQ4UyXNoxfcbvMTD/
	cGctGOMoraxeEZyWnu4AVVLHTcgcPRsUnZTF1kI3o15CcY/0VAT1cOjgcxnvFzQ/N3nHcv
	9jxzaPpKR5Uj13dA9vtyYhSPW4p0cKFspXOyHUVTseVAeGD4ClNz8=
From: Salman Alghamdi <me@cipherat.com>
To: luka.gejak@linux.dev
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] staging: rtl8723bs: rtw_mlme: fix long lines and
 related issues
In-Reply-To: <20260426225552.87114-1-me@cipherat.com>
User-Agent: mu4e 1.14.0; emacs 30.2
Date: Mon, 27 Apr 2026 02:12:22 +0300
Message-ID: <87lde9pb8p.fsf@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

I noticed the function signature continuation lines appear misaligned
in the mailing list archive. I've verified the alignment in the file
using cat -A which shows correct tabs+spaces:

  ^I^I^I^I^I    struct wlan_network *network)

The misalignment appears to be a rendering artifact in the email
client or archive. If you can verify by applying the patch locally
I'd appreciate confirmation, or if there's a known fix I'm happy
to address it.

Regards,
Salman Alghamdi.
