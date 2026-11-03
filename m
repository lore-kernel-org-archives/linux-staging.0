Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706122;
	b=0z7H99/CEtkUYy+Mpfi/DN3Pow5BJ6Nveq4vUFC8evx6Bzgbrr+f+gYsmSfQy7trw5D9
	 eGE7HaGPP5GZQIqGr0koYvs/DiPxroHKHkyL8KX3PPWzoVKpIbL21vT96fZEgRMfYLlef
	 sxwEXio3UTolD5s00d7VQrwQTeHj52KgdfUvZAia1T/V9c1RqlhtVQ0e7wkFA4jfuSJxe
	 jaBP3PLn6I/fArTHzDNyqmPe1l2LIToby688rZYqkQFy3NmqyJcq8ydIKeqQXB1JdpXPY
	 /6RpIiz+piRRgLeNHAHrBRdGeqenWWsV4FHdS3BsGWvJgvKNWVkbf14nJN+t5iXHfDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706122;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=5Xuf0pp1J4fzupoLc5nOUOvqU4eXQLWvohmGp/7FqdU=;
	b=JzT/qto3ec1L4bTa9ko2QhvEFAqdt7gGm7UDxqJWu5qe3vgFPB6gFv+KpFsUJhW7L568
	 iIJ1sfe8Z1jUr662yKyrk4HpRBGdx4B/fa3yvfZsTuY3jSGv2wnRIOOOrblPb7BBL5I9f
	 L8OOzKy9+U7GpYnRRsXsHczBF1Z3izbaTxh5dlKy35Wg97IIlbnEMVFnRDGAhBFutwxPM
	 pe0ct9f1c0oCB/kEWhAcbG8pZwnq+gnxccGHhqwYqzxoOqO6y1Fgn7ecULOqYHFNrq4ED
	 WepTyPwLKwFXSl+0c0RDgC+oss7uU+1pe7Hn6CF+fFk39FoNCUx6w1LLbMj27G1qvZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smail.nju.edu.cn;
	spf=pass smtp.mailfrom=smail.nju.edu.cn;
	dkim=pass header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=P94YTgtT;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D4608362B
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 11:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A9D4608362B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=P94YTgtT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1793706089;
	bh=5Xuf0pp1J4fzupoLc5nOUOvqU4eXQLWvohmGp/7FqdU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=P94YTgtTCUSlaOHYyJse/pHvYGHj4oXOXyPuAaq92WW4CU/PGU6rTHcMEMfAc+BrB
	 XHVKcoPD7k3Shbo/p1DbMSbDTyb1i7xNGPYbwoxRbiiN2nxzQyowZ/fEK3VLqMcQK5
	 UFNF8FPHx6yVdkeGafoj4nfohLOVcdYrgkudkInA=
X-QQ-mid: zesmtpip2t1793706083t45cfa590
X-QQ-Originating-IP: uVoT/CjcAt0M6QyD4Te5skr3PmWTAJqoJ841h+R2er4=
Received: from workstation-Precision-7920-Towe ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 19:41:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15079065597483944055
From: Kang Chen <k.chen@smail.nju.edu.cn>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Raushan Kumar <mitramaurya80@gmail.com>,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: reject short _DSM packages
Date: Tue,  3 Nov 2026 19:41:21 +0800
Message-Id: <20261103114121.74901-1-k.chen@smail.nju.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NELwyfGakffPybP1pT/2iMGNURA2H78egXYTITp9z5kxUhJ+oR54uokp
	lvg7SusGm9T/key4RSuTGPwwh0PN8DcA1YfUsCZAjIpTLnjsC8S0h+Ewpy8DNcmU6CMxBo8
	dR9TxCCN0t3iHImk2QVbLgnB/QbN/OopmPYCMY4MM4Zqa2MtjqAB9av5lIPSaHDhol4LdGg
	Wc72tcpGkaHuIeGvPCVVyAs/ZJqpRfFAAI6CMGN1C/ZjbhAZP8X+pdcpGHCgs65x3LV0KcQ
	H4ODQosuzjbAOXH4jok+eodOEgup1ptckI6gADLofcekIbaiqQKPgw6xffbbwW/nXPPkbSB
	Ngs0aykzYrc9dyQI+ErFZjYpiCeed3l3qDrmaSdMZnkPSr+sbP7skiacXm+iklR1uppbF52
	jJrVLxx+xLjf+3HvIDgJjOV//B81TRssRXEBMdCmAS23vBOEh1o27lwhAS7RvcXpupK2ykT
	PumJzmKD1UiaqKW9sLVd7WI7PUgT6C1+5PytcLN3H6heeMBZFwA45VJ2JoaC8UCHsqSCs6u
	kMPPQlAfAov8u7KNO1ez46kY83l83ouzQ+2wQcbHcsa1fC5MLpq6bKJQLpTZQRB42RtNudi
	crYLJI/LX3H+5bN29E0Tz5Yvn7kanAfSpminrdZ5u5gv87AHKiJJuRbdQieUU9rmW4r1ud4
	JATUuvj/dBFHjQdewO/9+sjFfqR0IaIO9PArUQJzX4miy7cFmkWI7LmRi5qDvTuwHTVwgaF
	VvYg9rffiJG3L+DEvP9a+wBS7Bd280w3j1QTTdV1PTe6FXXPKHa0fZ9Dx4IFmhG/C1sQhdD
	vt1g69DVB8ah69Pu13Uy6rNDMD2s//Z53cszn7XTQwqOcYPZ8osnO4zSG7qWnHSaN5HOCy7
	0oiJnNgJQk2HQIs463WyuDZIJKSwTbJUI4H+RkP68rfgBYuP2Y2fIxFFTtyLpSyUiCXNHxD
	+T6HLG5yZlG4mzaoqDdQc9xvjtRb2CA3KwylGKEG9uZz43WNv5Bb5e6sHvTnldPM3gQFd+S
	IgWGyH+YhK7SJMtPJL3IfDgCnrKoGg8vao1tfFT1WiS62Nw50lM/WYnzsGLb6Z6pscVNmtF
	Q==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

gmin_get_config_dsm_var() walks the package returned by the atomisp
_DSM function, but it does not reject packages with fewer than two
elements.  count is unsigned, so an empty package makes count - 1
evaluate to UINT_MAX and the loop walks far past the end of the
elements array, reading unrelated memory.

Require at least two elements before scanning the key/value pairs.

Fixes: 387041cda44e ("media: atomisp: improve sensor detection code to use _DSM table")
Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index d628fe4dca6d..159b72c1eb40 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1167,6 +1167,13 @@ static int gmin_get_config_dsm_var(struct device *dev,
 		return -EINVAL;
 	}
 
+	if (obj->package.count < 2) {
+		dev_info(dev, "Invalid _DSM package count %u\n",
+			 obj->package.count);
+		ACPI_FREE(obj);
+		return -EINVAL;
+	}
+
 #if 0 /* Just for debugging purposes */
 	for (i = 0; i < obj->package.count; i++) {
 		union acpi_object *cur = &obj->package.elements[i];
-- 
2.34.1

