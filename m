Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD43F58CA
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501479; cv=none; b=hjbLevmX3lL1mqLk3+mla8/JR6AREnJEvMUVya1QgPyt4A1VcrIYIUaHZTaBY1ZsCvRQa7EjXnxKeOVp2/GZUHYUqbBmCyKwxeKqbGJEQhBw/1VCMBTiNfDxvMiyeWKja+LhkT+Q1+JrjXWnfe1khQnwzYM0kygncSXvxgFjFlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501479; c=relaxed/simple;
	bh=y36FUV+Kj0COd2vvIG9U/6igV1AeQxXH+J1W3RL3kQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ing/ZntRT6yS7NnEuX1r7Yu2uU2aYA7lL+G0/MVfjhOedjzoLs8F7M4o3q9pejEckj5Xl4juZUP7NpxBuzO4CImtNbjfZXxm6JQpApGtP6W97ySloME/wXTMzYHiRqdoDFA1CkKZaQ2R7nSZNvZ/mn3NqMDe9XEFf0qGx3UyB18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=m9IyuGqp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CN00Qk39; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="m9IyuGqp";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CN00Qk39"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gwBxG4M92z8v7M;
	Wed, 08 Jul 2026 11:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783501474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZy96z5qFb4ItyQSThPEEv+Sh95ZU/kjNEwyLEXw154=;
	b=m9IyuGqpPV++bTETQPaxcjnOpLgXkZ/6V583bFfF6NZxshyrsM27DsmRhjN1HLRnhXqSra
	MLEchBaRh3ql7CGe5aknSsZkdOpnZ1koH+lXx2pGdhPQb5AzB9+JbSC33EZbQyFe1mTeJk
	rJmPzlGXGSVSD3Y/xeAPR2AtEH25l93ZjJGsSGxQosL7TRiGtlPz/v0Rbvq4O0u+6SjNYq
	o0EGlMibXtQhqNqVupsaBaHWaJXpaztNwQZFqrFor/Xq6WYvCRSj2ndEK6f3qq09pkSiJh
	jL8ftN6DvVwuoH35bggNjUckV2j4O6Qs/xMn0nFv58vS86fYSZ1/JL7kSmod+g==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783501473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZy96z5qFb4ItyQSThPEEv+Sh95ZU/kjNEwyLEXw154=;
	b=CN00Qk39X8M1SF0AOsp2/678wuwJfoYzNkOr5TJdueXwMlZUPN8MepXFb3hKAozahVLUGI
	qJ4UWwA0uWBTaaUhxWnW7ETTZ+mjFmBuTEkWIidHFulDONH8QdSkiB/kArh+nNABQ0tgV8
	8wrI/2VpW/3KRVMdX841w16MtkZSiBpxEzbzqMDH8h8nChFYd3HhMZV4CU+QVh9+Po0ZUX
	3qpCQRt+VSJO7rs+XaILKBAhmWgtPEqLhB+jrmOE66yIXgWSIAvfGc0G8Kh9ifIp9r2xBE
	50NFxJPByFZl7eNanZ/pJBaZLpMgtQVRXHHrerPtFh/dgx9wq0GkQmDjxHVDAg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: manuelebner@mailbox.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 3/3] staging: rtl8723bs: sdio_intf.c: cleanup function
Date: Wed,  8 Jul 2026 11:01:00 +0200
Message-ID: <20260708090058.307365-4-manuelebner@mailbox.org>
In-Reply-To: <20260708084808.305951-4-manuelebner@mailbox.org>
References: <20260708084808.305951-4-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b7de175c3d1666f36cf
X-MBO-RS-META: d1pazto31qj6hdex65ni5udfd8451mwz

Reformat function declaration.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 63ec486f9a34..fd805ee74a1b 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -334,9 +334,8 @@ static void rtw_sdio_if1_deinit(struct adapter *if1)
  * notes: drv_init() is called when the bus driver has located a card for us to support.
  *        We accept the new device by returning 0.
  */
-static int rtw_drv_init(
-	struct sdio_func *func,
-	const struct sdio_device_id *id)
+static int rtw_drv_init(struct sdio_func *func,
+			const struct sdio_device_id *id)
 {
 	int status = _FAIL;
 	struct adapter *if1 = NULL;
-- 
2.54.0

