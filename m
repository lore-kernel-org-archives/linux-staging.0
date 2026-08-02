Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D78E2931D3
	for <linux-staging@lists.linux.dev>; Sun,  2 Aug 2026 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785683975; cv=pass; b=ZA1ADWNFbpl9WWn1D4n3jthXuTdArapPe+XHaOlJs09GuYuoCfeZUVJAUVBhZmWATJgH+IT0j+qTZwb7Wwcts+IbsxKDThc2lPfQR+l/JmZ+g+SuNbmuMp4rGbWtsFvmL97Rc5wFDqtqNnHRNke2gMrLSG40zySwCqNi8hcqju0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785683975; c=relaxed/simple;
	bh=SIpTf0FU/N4TwcLUirVzRcBOLSJrTW89W0uh/KjWVCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQz6ZD1OT9cYf0Q9yC1O3fx+C8QreDTg/W8PTfEq+VEM+FA9gjdgbudU9ae12fUj00EsVbzrsoGUi3NUNpKbPG8cV7eXCokXRXclSL4NVPUoLDDe+lpXf7mIUgLEWd76fhTwiQZvjM24vpkOyAarec744u6BTdkllFyEK1TxrqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=VySkuZpo; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="VySkuZpo"
ARC-Seal: i=1; a=rsa-sha256; t=1785683969; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=GVoeOyFA6EzjRa6V5dGx0rz8xoV3E0lSmr4ZG4WYaZwuTQ5nyrJZSAjFu38oHifhgzqrghQRzMEsdkIohDIytyovTrNOxPSEAzFnSZGLH9CpVAUo2VMbzUZ2k2EDHz856Q4MMhYwU4LX7Jvr6wcRs9GPOo6/fiFvzqrOOGPY90o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785683969; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZesvTyENjPWflJ/ri0YnkpLoEqMFyRRDTixaXKlY4S0=; 
	b=S727RN0I2dKZbV96B+VK8CseQa+u5wAl2ums9DlG5n/NyK2kJXbPK97JFDgbXTgvg3UqWOzLbr1Y+4dNlocxOtUuMeVB596TpB9U4iH+xHTT1FxRznRnJfAqLCRyHDpjjqKi8hrRECWrYn+kbX0jhv6YF6ibwax+jCvyey+dEUY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785683969;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZesvTyENjPWflJ/ri0YnkpLoEqMFyRRDTixaXKlY4S0=;
	b=VySkuZpoTuSTZ0qN429IWoZPf39/MKg2EHx8VwA875ibqyGnV562wq7iF7dgjRER
	E4Co6ddYNloo9vvl/T/XGtA2tKKEg4agsU8mScdKAFW8StaedICU9Fp23KCs737JBBG
	Y0SduZPOLDdZ4c6fvB7C+UbnXGobEO68UcfTg9FE=
Received: by mx.zoho.eu with SMTPS id 1785683966889595.7882630784288;
	Sun, 2 Aug 2026 17:19:26 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: validate HT capability IE length before use
Date: Sun,  2 Aug 2026 15:19:16 +0000
Message-ID: <20260802151916.38931-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802121354.14245-1-ali@iusegentoo.com>
References: <20260802121354.14245-1-ali@iusegentoo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Please drop this one. Four of the five hunks are right, the first one is
not, and it is a regression rather than a fix.

The rtw_ap.c hunk is not an HT capability site at all:

	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_,
		       WLAN_EID_SSID,
		       &ie_len,
		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
	if (p && ie_len >= sizeof(struct ieee80211_ht_cap)) {
		memcpy(pbss_network->ssid.ssid, (p + 2), ie_len);

That is the SSID, and I put an HT capability sized lower bound on it.
sizeof(struct ieee80211_ht_cap) is 26, SSIDs are 0 to 32 bytes, so every
SSID shorter than 26 characters now fails the test and the copy and the
ssid_length assignment are skipped. rtw_check_beacon_data() is the AP
setup path, so this breaks bringing up an AP with an ordinary SSID. I
should have checked which element each site fetches instead of assuming
all five were the same.

While looking at it, the check that site actually needs is the opposite
bound. rtw_get_ie() writes the raw IE length byte to *len and only limits
it against the remaining buffer:

	tmp = *(p + 1);
	if (i + 2 + tmp > limit)
		break;
	if (*p == index) {
		*len = tmp;

so ie_len can be up to 255, while the destination is

	struct ndis_802_11_ssid {
		u32  ssid_length;
		u8   ssid[32];
	};

and rtw_check_beacon_data() validates nothing but len <= MAX_IE_SZ before
that memcpy. An SSID element longer than 32 bytes overruns ssid[] inside
pmlmepriv->cur_network.network. It comes in through cfg80211 start_ap and
change_beacon, so it needs CAP_NET_ADMIN and a beacon that hostapd would
not normally build, but the bound is missing.

I will send a v2 with only the four HT capability sites, and the SSID
length check separately, since it is a different bug in the other
direction.

Sorry for the noise.

--
Ali
