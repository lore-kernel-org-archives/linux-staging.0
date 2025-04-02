Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85B823E358;
	Wed,  2 Apr 2025 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598075; cv=none; b=OTImkHvdrBcashgMgERTECvmJS37rytK1SPienL4+azyqVoWGtLxE0OXd1+uUAtFq1armVCMx5dYeFUHa+5m+/Bs6TdFP7n2Aqrpm4sGm3eFN5iNqO5AqR9Sr/G2INxBho5dwd83TBAKx6PO42TfqawJj/b8gsfdtWWHspYAd8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598075; c=relaxed/simple;
	bh=zSoehIniU8jm04IOOedJamJbm8GIIQPM5e7PJNzDOKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hLipKCgYRF1V3XyAy+TEJBYjAvbrJFZU+D+lP0oiEIGYMBAjiYwRAsRS3U5oBmSQKR9wBGUatiUxUR2l3OtW3p9CyUsNymO10HQ4knGZyZClQv1lpSZa89xQ4lnvGeunItSw/5OoSBmQSlveWeSFAxl3Rm8+KgMPTMObzJgAh5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/B7G3vD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/B7G3vD"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso6566042f8f.0;
        Wed, 02 Apr 2025 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598072; x=1744202872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEWeMCeaswgmteuyJgZbeIbf8aY5zFHTFf+liUe5LTg=;
        b=k/B7G3vDrVLHtw5Uv4iIMLNmfAQrfKiPjmkDu+zwglWKwcuiAW1iS+MNopKYCVf5T/
         sx7V9Hvin91IiIZBJRyvixEj0VIuds5fAHIolJMMkvP0WKTZz4oHxUO33ZEZsz7FIhM6
         eVWW3QGuDQt3z1XkEcjv49+hhB5A/PT0i8lmwrvFX+0dSgpEZv3SvuAx+IQFlV6zYB23
         qIcHJvaDRCdJCTv1kjLSWpsmmqV4YlOor2QbGB5obnoxugz/DGDjhgTjgxsNj6pRo+Pj
         B9KLdiwPPBVWS5/Z0blj3CScIk3vQG9HpZbRHPNGNGUPpRahprQhsHrO9nAk7XLs2vv0
         zCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598072; x=1744202872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEWeMCeaswgmteuyJgZbeIbf8aY5zFHTFf+liUe5LTg=;
        b=EDcIc4QS05+aeiy+MqjgXmE7fyg6Vq6XxtWfT2A1OcyCxZh+YGij3d3an0zKkblVRK
         2pebdCANuTRR9ykysVzOlzg9ogP4hHF/yFVArXyh1XBUOEaLT0GTW1o66BXmlioxvBG6
         EiKau1zB+3G9WpUQTmkhDIlESJJ6siR90eaDTKimyo+RZ0mFl6kTOoegHQeSvUWjpabv
         b2ybF47lF/wjr5auf+OBgVP6XMvufksIZ04M5Uu/kNz/Pw+w/TDTg3Ryik0IKii3Pxwb
         2bWOPZdlZBEyurBimcMI3CsqBeTFypw3v1tg8K5XObiBMfIH4JQEZ26nuzvXRKx3wl+k
         0OoA==
X-Forwarded-Encrypted: i=1; AJvYcCUCU8IJry5mmtN6yReYDPcvn8QzPMyUFpCaTCv6+6WWsz0IuogJgPjjNHKQ8Eq4BC5VjvpEutppeUnb@lists.linux.dev, AJvYcCVQXcg+6pl6LKAxl+/sQmUl6jKuiaNyineBXg5jrFUfY3LS9ZVeXFIf1J6B34Qr4MaDGd5wQBYB+wpYwr8u@lists.linux.dev
X-Gm-Message-State: AOJu0YzcxPrUhSLbFP24NDhJjBIL5N2kj5L6iP+nZpDh25V+O1I/9+rP
	n1j1yBNF8uE74nEWN8RCOk1odoDg5X+bByqZcRxc+gcdj0gLEOOglF3COS9Hthc=
X-Gm-Gg: ASbGnctjx0b+uTK2/WUxLvtcSA4FOM2gAWsijjW3Gfs1XjcRSl+12str1eaBrAhd3mg
	WhbqWuNik33oieuxlVcavTPpCy5dcuOgSiePOeuzNy58mzMM4eTjLUVJnegsr9HRNYfYn20rR1a
	LOIwK/GPcOWRdzgYPt89GJx4eDZKm45UFxSNaGkgiCfAP27Jaj2VBTIeibpB79kElsx69xl7jhJ
	ZBqCyWFCw1F1qx6xSa8pvjnfn3VN1OjByGib5Ec/56HHgSx6zSUJMZKldVCUw+FgBeu0P8vjL2p
	ZXz0Db0JQP7riWYmjUp6p4HeK3xpcyrPuiRRntIlvw==
X-Google-Smtp-Source: AGHT+IEOTmnpf9qGDadsLtbYyixVKFrhrd0ujtS0ksf/cMhCW8I+X2FWzaYLi0rLTArKqpzOW2dvHA==
X-Received: by 2002:a5d:598b:0:b0:39a:c80b:8288 with SMTP id ffacd0b85a97d-39c297698fcmr2134047f8f.33.1743598071795;
        Wed, 02 Apr 2025 05:47:51 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b6cd2sm19675985e9.39.2025.04.02.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:47:51 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: rtl8723bs: Code cleanup patches
Date: Wed,  2 Apr 2025 15:47:40 +0300
Message-ID: <cover.1743596287.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



This patchset refactors the rtl8723bs driver by replacing
integer literals (1 and 0) with true and false,
improving code readability and consistency with standard kernel practices.
The transformation was performed using Coccinelle.

below is the coccinelle script used:
@initialize:ocaml@
@@

let same_function p q =
  (List.hd p).Coccilib.current_element = (List.hd q).Coccilib.current_element

@r@
expression e;
position p;
symbol true,false;
@@

e =@p \(true\|false\)

@@
expression r.e;
position q : script:ocaml(r.p) { same_function p q };
@@

e =@q
(
- 1
+ true
|
- 0
+ false
)

@s@
type T;
T e;
identifier fld;
symbol true,false;
@@

e.fld = \(true\|false\)

@@
type s.T;
T e;
identifier s.fld;
@@

e.fld =
(
- 1
+ true
|
- 0
+ false
)

Erick Karanja (3):
  staging: rtl8723bs: Use true/false instead of 1/0
  staging: rtl8723bs: Use true/false instead of 1/0
  staging: rtl8723bs: Use true/false instead of 1/0

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 12 ++++++------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.43.0

