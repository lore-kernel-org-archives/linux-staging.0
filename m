Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B551394786
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 22:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778279254; cv=none; b=mRCaO42a/Ssm5d4j10ev3BYy5GPzHgE3UK/lD08SBVpX3f2isoP3Y1yzBiFyxwXIAjD8PfA+dtR2ot1hhq+RyvK2S+TMHbn5PaGd6AimHAnJR8Ws7uPx9t++aNRUF/P/Pk0Oo7DScpyk2RlVQG1VHck/tRTg4FtC85UkMyG0Vq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778279254; c=relaxed/simple;
	bh=ogfnSpVkWhJjYE4H76H+8fnS1yys5WSfk3yGwfOQqio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V2+69ZBjtHzOUlZNAzNAoLrWqjYyEd68lW6dzNoSLyYwj/8H2i2DWvSW6KEqbxdhXvibidltUvBhpWVOTunrFpeckUqpevITndLMMJZ1YMwJItHxiXj/dU3GI8bVOeO40OL1G4jhPs7fqLv6kl35t98UuiCyESfzkVvRSuWv9xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=cATJV1YC; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="cATJV1YC"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3BF284FCC;
	Sat,  9 May 2026 01:27:30 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778279251; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ds0s6x/IEdSEFe5Ej/ZAy7XvpQEIA8Z6370zk4udx44=;
	b=cATJV1YCT9jD/Ln9Zdmee3ipKMoY0jsfuzoNhqjwv773Y6HKytKz60dScFpIn2MeEBP3RO
	8i+zduJIXlQDuix5RWGcGrDV4ZFWOIzksRSR8tnBl17aaqQkdeWVAApXAhU33FXifTCPFk
	4FeiuG9kYjekQ+rco+GddbW3LfTWbK+xyIsN/dh0yHdOPqSO7KpQsWlpDNlPdWmaQUBHxz
	usIv2NvnfGn164euzSnPy1L0fCs6h/BEwWET+PDBNtkCzaThI8wQY3gRpgPIGax7TeV+wy
	Md3qGJCL+ZTFg3i4LyypPsmFcfDRqlAN4xuHKru5at+ycVWEyIryO2i0vyzw8bXUBCdOlv
	MEB5m0SeqBQInPTPviz9flgDTJ9RY6WJD55tDlt2RWrjkY6JUT9O1plUnOTNriE+vouERm
	xhDAqjrlT4Po8Omi3zrA2Sg1woXxsRXDPb00H3PGFXGINvCKUVdJQQs2KGLDmI0DrYeTFD
	YnIrytKk2KPGAkzvz4CW6AeDh5ESCjlNEy97jRjoaX5xuvDExWi1HsDMJjy8/pyavQfXic
	OpCfed9jzW30R4abuZQSfHehvX4jZRTKn7k7+XnDfhe5i1weCYUClyI/LBz7ny6Si65Wn1
	E0mAn8mB0wb/OmuHMcIPx/YcpEeiQwVY8g0+9MkIxQumfAIV2tMD0=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/7] staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length subtraction
Date: Sat,  9 May 2026 01:26:57 +0300
Message-ID: <20260508222725.24075-2-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508222725.24075-1-me@cipherat.com>
References: <20260508222725.24075-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add guards to ensure ie_length is large enough before subtracting
fixed IE offsets to prevent unsigned integer underflow.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 268f294528e6..9f21a2226dbd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -604,6 +604,8 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	privacy = pnetwork->network.privacy;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
+		if (pnetwork->network.ie_length < _FIXED_IE_LENGTH_)
+			return false;
 		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
 			return true;
 		else
@@ -617,11 +619,15 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 			bselected = false;
 
 		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
-			p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
-			if (p && ie_len > 0)
-				bselected = true;
-			else
+			if (pnetwork->network.ie_length < _BEACON_IE_OFFSET_) {
 				bselected = false;
+			} else {
+				p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
+				if (p && ie_len > 0)
+					bselected = true;
+				else
+					bselected = false;
+			}
 		}
 	}
 
-- 
2.54.0

