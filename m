Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA9B2566E9
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771701005; cv=none; b=FYWJ6z9fKQvSx9haiGG3WoJsraR8oo/mlcV740WexfRk6yH0LDX5hLTWXQ7hXw+zTbs1xaB4D29cdreZ70NmXmjWry8cxhyAZ3vAQTYAmsiSaNgCdnClyNDVhHfWa093FQcIa387Dvbfyeb4/I9XYmnp+sTtxMA3rrEdNLvYtgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771701005; c=relaxed/simple;
	bh=o4Jscv6vkyIh7GIMFfWCIGxqqG4HSk4Zqtr9dg2x0Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phbjXIbg02EoMko/8u3x6Ajlgs7mcXQyjtilsLMz1zTZJGvrrTVoKFDR49BkV2ItE3jHbAkHMzlOM9zaw3WGB6qyw20Sjc6N2NOYCHHkK1OY5RRGzl2naJbUKwGD4aeq44uHwCT2IqilYRDtcELPL/ksTTHKjbjRWu8y4VdEn50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=E3+NEcla; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="E3+NEcla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771701003; bh=o4Jscv6vkyIh7GIMFfWCIGxqqG4HSk4Zqtr9dg2x0Hg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E3+NEclazmaqkrjToLac+zcKB9YX72+I5EP0mMlZZPccngip+bSX2MoFJoTFnTvWu
	 s/2lCvwBj0DbIBwfFnTcaYcEkfjNjmpyLW/U5e9qRFiLWqg/wj16gmz/MGL5HQyAa6
	 yDFE8/PKFW+VMkxwIHgrFN1FRFTUArXNdNUoRQOUSNAPmUln4azJJUW/6jxMJIAokj
	 oS+H2zqKwGYL6rqdbNQOsevujUhJ0Ff3QYUh7Qi5b+79GlADYbQOHF2SwuagiR8UkX
	 eS0MZgyTPSDA94aVF6lOGCWh1kY0WG8Fk/h7749VwfEWzGhxRxzpeVBn+f7SVq/5Eq
	 hMU+u1iZGeuuQ==
Received: from localhost (0bd2-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::bd2])
	by mail.plaes.org (Postfix) with ESMTPSA id 1566D40221;
	Sat, 21 Feb 2026 19:10:03 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	JJ Strnad <strnad.jj@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Milos Puric <milospuric856@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] staging: rtl8723bs: Drop unused NDEV-related formatting macros
Date: Sat, 21 Feb 2026 21:01:37 +0200
Message-ID: <20260221190628.50273-8-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221190628.50273-1-plaes@plaes.org>
References: <20260221190628.50273-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unused NDEV_ARG, FUNC_NDEV_FMT and FUNC_NDEV_ARG macros.

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/staging/rtl8723bs/include/osdep_service_linux.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service_linux.h b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
index 2ec54f9e180c..c8274da940ff 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service_linux.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
@@ -98,10 +98,7 @@ static inline void rtw_netif_stop_queue(struct net_device *pnetdev)
 
 #define rtw_signal_process(pid, sig) kill_pid(find_vpid((pid)), (sig), 1)
 
-#define NDEV_ARG(ndev) ndev->name
 #define ADPT_ARG(adapter) adapter->pnetdev->name
-#define FUNC_NDEV_FMT "%s(%s)"
-#define FUNC_NDEV_ARG(ndev) __func__, ndev->name
 #define FUNC_ADPT_FMT "%s(%s)"
 #define FUNC_ADPT_ARG(adapter) __func__, adapter->pnetdev->name
 
-- 
2.53.0

