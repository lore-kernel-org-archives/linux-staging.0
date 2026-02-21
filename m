Received: from sonic311-23.consmr.mail.gq1.yahoo.com (sonic311-23.consmr.mail.gq1.yahoo.com [98.137.65.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5623081DF
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.65.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771667103; cv=none; b=Rsk9Pday/zaJIRm8sXwIyLICU4K/df1MTEaeC60VG/UQtdzwuvH/G+NEEwi8cSJb0bBeE6HAxkb7Y9S/IjMuIB+V0WTRpeR2HmqsmH/sd21oagHO6bwQTHq8fdNdKbyjQdw+clAzLb0hIsJGjFk8yHu2nJgm9ZkvxIC/jdTJ9NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771667103; c=relaxed/simple;
	bh=TLPRgoabyxRfFQDpQRq6bd2NxQKi1/Tov5MD/p+7mAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=sNuZVjc5yqJebqwAc/w5uPz9yPfr1TMYU/gvDw24BrO5JjhzzNo3dYpTkYLGib4k8LLHi13t4SoIDJbL5TeMs5zh/0pVUpfaEq5qHSkSaG2XnbGrg/BhsULhIJF226aFVvpXQgj3QVMz6+8K+f9oFuY7lHngyCJjNq6KyA0CPsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=gB8jOiMY; arc=none smtp.client-ip=98.137.65.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="gB8jOiMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771667095; bh=sVPECrLP0xNuNvLA9loArm1ZMF7Fvf+SaWapsBmumOw=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=gB8jOiMYNYVNtWuU3/xgfRPiNZ9P8o1bGYI9q9aoVQtohcgsVdmWqEX02QTkhGl4dYB92DC+3wRJiYm/6d77gjWTbIcUT9UzecPhgNRLry+rWrdHyZqgc7U80P4PX7NvYOIRJQdCs+E7uShcsF49eukC0JWM+luFIMZ0EOvPlztcuP+VsUKKlu03YodI7Mhq46WW32ThSHTSYTC+MCC/OfGqS89g66Tj/769WTVMOTvbzNf7FUN/GNRQATe37ZzbYOuVaUKFE/FPfYSn8EqhLlZeDse6IBpjHQVzx2dcrigzgijjmxvAfJ8KNtnoIUvMOop6yMLjfZxgxNm8DnX9OQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771667095; bh=f5zABl8I8ByVHYN/rWJU8OJHMT/Q8Iu/EZOFo37yI3f=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=edE9ftBPzYqEMQQmcvaIWSJT8KB511Ru+c2VPQqJMMTnok4+7XdNxcFacXd6JgBEwFWPTHPf0B6KZYWYG4sk0aIodiE8IKGwm7Qfv7b1r8heccAs1nhvqZxlYoSbf/HUNSz7E/1n/jqT2ftOp4X+pgn340hY1i+cHadUgnVEhBsxkoqtzygOU1I/M2nDYU5PZ8LqX5ARaHy161Ro1UglEbIsKav6ZIYfNBgdCqhpWu5HJATkoODIOSkVCtbwAv1Lhqr6Isj9huGlL0dXsqEkFPuwRhcbOOAh2hXE7VKo9oQx1K49DzULX6q5J9FjF222kPceXGEINa9oY+yCASYKdg==
X-YMail-OSG: dZuY_h8VM1lVYgDlI6bEmTNkuIbY8Sch5Ci8XXvNHnQ5Crg2nzxkYVLjaj2Ezd0
 hjbbMEJp2UrtH6bgUIxIjwXVaS8SWKY39VtxdfrNGcIExopdEiW_a5BEYvo5VB198s73cR5.B1pF
 7iyRVACIe.eRm_rwp.yFR4qItVcfgOpJsZwpcBvlSls9ahgZeK0kZUVcvgwZf6xi0rzRJ_uRM.IV
 xebphSeZ8nvlnXI9J6Wy.5WEbk6OfFyYod4XpCCSuwi73evvvcgmt.ErP77dNytiTlY1ODxiX8Yo
 PL9FBE.T1zJDUaM4Km64ouTtX3mCJAoXvUxoYmxugYaH9GtKK.UsrABVpa5D1BZBb.NCzgm9Bo4W
 Tp4iYVzWAIJ0xUJv_e.ByynZbYyxZLL5uQQN_56YMfckLW.U4IK3.vKSzfnKe4JY_uASfvwScSTC
 qmBQNvdPIwG8q.4wLebWCSyhC4IvWnXSkR2KDvo2QiOh1Hx11CpGHrXLAD6VFG6P58F7rMPBX6Wy
 TjSTmWBmNFxtfCw9OtvxnqTR.EPprN9ZfMyzYcOP2GUe..WykHfKjV.F47EYPQaewfMUF9BoYo_X
 mE2qdpWr6ySwT8.JFUH1Qr4Qv6iZY4Ekfb6vnOd1fi60W.DgMYIsBFbdNaSD1WJxgxeTM81.KVXG
 Oo2JkGdT_KWD6QRjsG1sr.k9tHUCWEFG5ooBaZmNpXiDZuxIqz4WjRCoJA.CMZz0WeMH_NJb2Nie
 EJj_JLfKEx4CYVYcqvsiys7wRoul18PEFryGZKNsqTXjsmqf35uIwCS44vyFP9vrJMuYCxsP9pHD
 Z8hT16uzs.ziBk_0diKiJX1JZLAsamBertI.19vCzByIRkwXBk3kMPkKELJwdbz4vMEZweUwvLTx
 3lbmcertcEn9A1T3Qc1n7jZMUjdilkFFk1vhTzGXjvh3BSwhkaYHfJTfDSmoJKjTyqJ2SOLrmsZa
 sJVshkdwogp0xfPbso.OO8E49RXUThePZWtX0FHralgnA1r6vU.qiFggiqAFDZ5KD2dJALuPcXYr
 7U58hoUrgJmrMneV8eav1VhxILHEba2BRfQlc0p.QN3CWEd3RYHGxs85GZmmUkuhBYUmamGLHTlm
 0dhzlAWTTiDb48uKr__ZhQLBfwSlPeCQyffOW01rV1pP6pI8UfH6_gIxqgmflkG0LqulLMYnUven
 J.bosNO5Gc_sHSHiH2QzZ1SdpqRw0d3i86nIQ61YeDIonJleN7F8rToPRTAm8YybCP.PP.rpjtmc
 KLKkw8xcLC8DtS_roVyyF8fGTiye5Uqk.OWkrzh4bNRa6Aqto0Kveq8su7luj1phhnNMcygMbZJk
 O_qVnQP8mDKDq1rol2esGNRIM4hJsj9xU4c62d8XwbiR3g8UTBQluhBCf5ZVMWcwL1iVq3Glm9YP
 .l0QmxZiFipRQIQ.AgP2ne7WleTvq_Bze3q64UZaduPvqeYcmI6Zw.Nsog.M9y9JldEPXJfKbdUC
 yp0.moHZ.pdXn.dhf5Gtk2ws1lEN6Gq5aQCGHqmEG5igp5ui9zkrwidIMVO0wRuPColql7WbOPZ3
 xYK0BrSkwNaXzpng_kfncaz.k55.CVPSd.o_y6GmG68oOHdMo_RFvJULtuvZwb6TC1jAHLY8pm3.
 C00k0jU_QTKSfUuHr5L9GuycYnS6izbVxGpIsMOQxhG0QzPBMmmcfLp78P6uoAwowPbUfLlNNxfW
 xf3nkQAVY9TrZgRBzVAOVjbD3V7jzC0RblSREriECN6W5Wrq4vA70.zsgtqyFbO2ui_BjEmWkSlw
 y7GXvDh6OTXCxl34kWQGDmP0ABGDmiTQNkhibAx4kGBKOJTn7E_EUTxWPgzKrzI6Z4KUmq9JZee_
 Ztxqu27XPVLLUz2XsmPTQgGXRyWTT3S86IIiZ_6EdivwOwPL0L0122liQtmEb9XJ_e3GR9gj6oLv
 W7QiZqbk6iWpXegeRDp63QoPjrtFJILBn3zNK4Q5w2lHHSKmwGpxZsFnFdWteMvEN0k0LzbRbZGv
 wi1r2g3gb0baov5KAyrijd0UJh66OBb73uTBwvmpqGreSo1.03c1.1QRsDOE.2Zj9WiwYe.YR4Zp
 Lxk.tc7.wLYrRmDYswymJzPz_aPZqRVd._wCTs72IKcotl0qfIUtOEvAFzJQC3sHTjnlT3DGyEXx
 5oz4hP2YRUZQ.YeabHfttESIysTRGoy4_PwDvk5HzKhGTEnJ04xrL4MbkIidHUa19QvKqkdgldjf
 _hhRI0ZGfIaJuPwEIouY6C20u1JqXD2UfmA_JeWs_gph.As0UtKlGIqmCMT7aJkEN2nU2ujI8rIP
 fQoJFgQkaDaQrTXOCxJDfkxPJUiO2.bfCpDk3
X-Sonic-MF: <sainiharpreet29@yahoo.com>
X-Sonic-ID: 1b17b6a8-3598-4858-b17e-d5dbc2f82fd4
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.gq1.yahoo.com with HTTP; Sat, 21 Feb 2026 09:44:55 +0000
Received: by hermes--production-bf1-697f88457-2mcdh (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 52a3f7a5619beba03832f884773a0064;
          Sat, 21 Feb 2026 09:14:29 +0000 (UTC)
From: Harpreet Saini <sainiharpreet29@yahoo.com>
To: Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Harpreet Saini <sainiharpreet29@yahoo.com>
Subject: [PATCH] staging:iio:impedance-analyzer rename camel case text
Date: Sat, 21 Feb 2026 04:14:24 -0500
Message-ID: <20260221091424.56822-1-sainiharpreet29@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260221091424.56822-1-sainiharpreet29.ref@yahoo.com>

Rename camel case text. This was reported by checkpatch.pl

Signed-off-by: Harpreet Saini <sainiharpreet29@yahoo.com>
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 85a4223295cd..f38d94613ea1 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -43,10 +43,10 @@
 #define AD5933_CTRL_POWER_DOWN		(0xA << 4)
 #define AD5933_CTRL_STANDBY		(0xB << 4)
 
-#define AD5933_CTRL_RANGE_2000mVpp	(0x0 << 1)
-#define AD5933_CTRL_RANGE_200mVpp	(0x1 << 1)
-#define AD5933_CTRL_RANGE_400mVpp	(0x2 << 1)
-#define AD5933_CTRL_RANGE_1000mVpp	(0x3 << 1)
+#define AD5933_CTRL_RANGE_2000_M_VPP	(0x0 << 1)
+#define AD5933_CTRL_RANGE_200_M_VPP	(0x1 << 1)
+#define AD5933_CTRL_RANGE_400_M_VPP	(0x2 << 1)
+#define AD5933_CTRL_RANGE_1000_M_VPP	(0x3 << 1)
 #define AD5933_CTRL_RANGE(x)		((x) << 1)
 
 #define AD5933_CTRL_PGA_GAIN_1		(0x1 << 0)
@@ -68,8 +68,8 @@
 #define AD5933_I2C_ADDR_POINTER		0xB0
 
 /* Device Specs */
-#define AD5933_INT_OSC_FREQ_Hz		16776000
-#define AD5933_MAX_OUTPUT_FREQ_Hz	100000
+#define AD5933_INT_OSC_FREQ_HZ		16776000
+#define AD5933_MAX_OUTPUT_FREQ_HZ	100000
 #define AD5933_MAX_RETRIES		100
 
 #define AD5933_OUT_RANGE		1
@@ -303,7 +303,7 @@ static ssize_t ad5933_store_frequency(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (val > AD5933_MAX_OUTPUT_FREQ_Hz)
+	if (val > AD5933_MAX_OUTPUT_FREQ_HZ)
 		return -EINVAL;
 
 	if (!iio_device_claim_direct(indio_dev))
@@ -699,7 +699,7 @@ static int ad5933_probe(struct i2c_client *client)
 		st->mclk_hz = ext_clk_hz;
 		st->ctrl_lb = AD5933_CTRL_EXT_SYSCLK;
 	} else {
-		st->mclk_hz = AD5933_INT_OSC_FREQ_Hz;
+		st->mclk_hz = AD5933_INT_OSC_FREQ_HZ;
 		st->ctrl_lb = AD5933_CTRL_INT_SYSCLK;
 	}
 
-- 
2.43.0

