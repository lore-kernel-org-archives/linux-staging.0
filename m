Received: from out203-205-251-84.mail.qq.com (unknown [203.205.251.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295F17B
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 07:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1648712305;
	bh=Jv9fkwCRcn6MDNriIVgJm97e12CbBytcdFXcKMLI9TU=;
	h=From:To:Cc:Subject:Date;
	b=F9erO4iTHcHh0shV4P+5E7zmnQSr0pHRG2mgXG/ELPQJOfkiUR46ppTPD6KGOxuG1
	 SOLzj39uPRGPEUedBX49lAtLGWunJm90CzmWIeNA8+t2ecmylWYvYO3IxrH/Kn0agt
	 MyAk1tb7tRlG9uHy/BlpiT5feqJDYqbqIUIQsdfU=
Received: from localhost.localdomain ([43.227.138.48])
	by newxmesmtplogicsvrszc6.qq.com (NewEsmtp) with SMTP
	id 94CB3206; Thu, 31 Mar 2022 15:37:12 +0800
X-QQ-mid: xmsmtpt1648712232tem7vi6p1
Message-ID: <tencent_884B806033C3E7D6734450A085172A55FF0A@qq.com>
X-QQ-XMAILINFO: MyIXMys/8kCtORY7yWGrtDHkNV0SaQpklB00hVKoWuEBCXHGz+06UHLX+1Ob5d
	 wIuFCo1UElqeTY5gT/mVwPZBNWMCF05N0xZ0ICKw7Q2U5ug/nQdPkNu/JpM92mEjfZQ5L8VlpRv7
	 hVOAiplLNUl1DmfdqGBiXx6xj4F68FiSRLTJm49NsoYfnf5KHTq3VScx9h5X2mKsuXUcfgJupaJR
	 FZWt/eu0gudpq0JJCccDhtfEuM+oW1wVkmdX69B4vtJ1dFYOjfQvX3zJopez9X5piQsjX+mInSgv
	 Oy5WGKaQSWVYx+p8o8qE0Ukzl10v/QID9Rg4Jn+ktciB8Z7NfcEiJt7UcRIq/pGbf6bQbpOZp9Oi
	 airREyR1EzPX3ETngDmH7Li9nu9TxJ6FnVlaBRPEL2KN5Q3W1Ju6BSBJ5/oJJSZ6WwXYUDPDCajm
	 neUBn7wnDwEwYVT7VJv/rP+xT4COvfW3J7rr6IaO0wLbVfsxE2vWXmoceKGpfR18OtvcaTfv/u6G
	 khIObEIBWhq4B0c3+mg9z5GrwSd+8YkW5/MsS0MF2Sc5Z6XUD1Qk5v+VnObSih5C1BU+34RuztML
	 7tl1SR5R7sXerbGr0NGVGxsCUeM9kaSgfyfEksK+GCm9sVstHh0fwNYdhkHSzPb6R3gdQ5NyvzkX
	 mShRvoIBxiJc0/fglZ+KP1ARPt5DMVybNTq6qliT8RO+Gu8z4WS6mKPfGqnowFM+q+lcBIDWygqb
	 ukJPqImMCf92XUA7Av7MEtFfx6F35AMZiY6zCb4W7b8wC9yBf3ZiDVOf2WReaSGi9lzB/iXeDIgz
	 ZIPI6MuHfuOWUmpE73ZaOti1qEtNQ/ORh4+CBMMWL+Ba530qgXYFq77Lz8f4Oz2S6joYLXs3lrj+
	 3EgF5KgiIU4+5sraNrbDdXA4fl48KNFgbuE6ti56oszw7uuTPJPSx4m9+3v3+Na6xFNUHKhORrz/
	 /62OjzkN5JQFFEhJAwhymf4lxydQmh
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] staging: r8188eu: change the allocation type of pdata_attr
Date: Thu, 31 Mar 2022 15:37:00 +0800
X-OQ-MSGID: <20220331073700.7505-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

`pdata_attr` was allocated by kzalloc() in go_add_group_info_attr(), but
there is a lack of error handlers along the call chain it lies and the
lifetime of `pdata_attr` is only in go_add_group_info_attr().
Therefore, changing it to a local variable on stack like the other
functions in rtw_p2p.c is a possible choice, such as
`u8 p2pie[MAX_P2P_IE_LEN] = { 0x00 };` in build_probe_resp_p2p_ie()
which is the caller of go_add_group_info_attr().

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/r8188eu/core/rtw_p2p.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
index e2b6cf2..f1a5df8 100644
--- a/drivers/staging/r8188eu/core/rtw_p2p.c
+++ b/drivers/staging/r8188eu/core/rtw_p2p.c
@@ -27,15 +27,14 @@ static u32 go_add_group_info_attr(struct wifidirect_info *pwdinfo, u8 *pbuf)
 	struct list_head *phead, *plist;
 	u32 len = 0;
 	u16 attr_len = 0;
-	u8 tmplen, *pdata_attr, *pstart, *pcur;
+	u8 pdata_attr[MAX_P2P_IE_LEN] = { 0x00 };
+	u8 tmplen, *pstart, *pcur;
 	struct sta_info *psta = NULL;
 	struct adapter *padapter = pwdinfo->padapter;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
 	DBG_88E("%s\n", __func__);
 
-	pdata_attr = kzalloc(MAX_P2P_IE_LEN, GFP_KERNEL);
-
 	pstart = pdata_attr;
 	pcur = pdata_attr;
 
@@ -106,7 +105,6 @@ static u32 go_add_group_info_attr(struct wifidirect_info *pwdinfo, u8 *pbuf)
 	if (attr_len > 0)
 		len = rtw_set_p2p_attr_content(pbuf, P2P_ATTR_GROUP_INFO, attr_len, pdata_attr);
 
-	kfree(pdata_attr);
 	return len;
 }
 
-- 
