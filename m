Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED5E41B343
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378739; cv=none; b=unAkNK0Erk7SVacj0F8db8HSEm0TfkO9SARM6ZJWkZq6irdwLvYXTgQnbQuJmPBi5uFmKTbN7QFSbSBbLW7sbP5i7bmPPziHxH+ntJDSmQM1Kff2GGCi/dhruumtR9zpKFjYcZpCpFTKtgLkizE1hfEQ5gU3zRLKoujfl+AQAds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378739; c=relaxed/simple;
	bh=gX5EVB9aJduPQXEjF34/u5ebEZMDxiDXBmFbNa8ezdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dj85hsDPZaSpjOnKAjqe4d3H5Fgnm6w3h01EjfWBN5IAZgD1NA+NZmWwlZpbWxCeq70BmIDttmVzJEVxaezfgywWBMB5FH0jAKONuQLbQMDZhJ+Il03f+ChuqugKP2d+0Fk05S01UNyB9jeJmBcQkaiKoNznQ2pA0Hp96gZ7rIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=tpq+kqMz; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="tpq+kqMz"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2EFE84F94;
	Tue, 28 Apr 2026 15:18:47 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777378728; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JWbGjNQSz1N1X/fRbDPnaKjDxLta5ws0P6n36UQYDhU=;
	b=tpq+kqMzMhClBDqpWtIG4A6kGT5OuMq0ZOUeY5VMI7DqvpHuhGlILNyJQ/eepZG8/nPSiu
	DMfPCkwZgPo5SBaRjwk6cocne+WU2F8ARi3pFKZ+gnEsEVC2hFHf9SlONyU9qAIL5vVjNu
	LNU6K6eDAPbiWHkO7PxPjcxgjwW2Tza8RoyQV2acyV5ASLne6jlR2KU3muI0siwVSsVFYn
	UaFvtKMN0N7JOhqTGh3XhrSoY5kx9zTzw2LLxl5V//Njavu6PYBYfIJhLhR3BRlHblnsO/
	77+wQ/tjc1BS9xZv5PfulVuKZnKlIXFwHNYFfsY0GbkncU3LjaclJaf2fIut1th2UbjNZL
	poSAAChYNnVVmP9VZL6t8wOgo9rQV4uJxzmvdG7yt8O0xWZ37k+8yrZL5YzPqbeP8Y/011
	VSKClUomXekzTfPv/7cvaf+f5ps7Ioiu1O8+kpq67Vzsz0B2FzBdPhsZ+8xRd1qmpnfZLO
	/GS1/D73PbX+BNgIFk76k5vt+S4teDhiB8MbnLfWNF2AigJqLsESsbsNIrx4r+VwL8BFyi
	zw5/BGbcINy5tHqYfsuom+zfSfWYBBvtcmSR+ZfRLnTEemyZ/z56P6Br72OICkCB0TUBJp
	K99LHN+vFho24Gx+d7eTMlyFWS92t3Qw9pBJtZRDWYJbt+gAFfey4=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/8] staging: rtl8723bs: rtw_mlme: add blank line for readability
Date: Tue, 28 Apr 2026 15:15:51 +0300
Message-ID: <20260428121737.435248-9-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428121737.435248-1-me@cipherat.com>
References: <20260428121737.435248-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a blank line between the WIFI_UNDER_WPS block and the
wifi_spec block to improve readability.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 9ebaed8bd7e1..8d20852c1afd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -626,6 +626,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 		else
 			return false;
 	}
+
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
 		uint ie_len = 0;
-- 
2.54.0

