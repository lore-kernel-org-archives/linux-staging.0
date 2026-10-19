Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3603B2AA
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 00:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368346; cv=none; b=GPR3nwNNAAcSFRUbN/MWDk5JJCFPqd9ZkgVvgaWSNo79JxHAkb53E/2xqlsfB0wVvzQgi6/vO4Nd3gsm9BLQSnUS4Yf0BxwbThmY0GLeQFfqMaxuE8kiq25npowqmPfBx7XvoAPABpL1mgfPdGTLlD3sIntAoWIrFOMDuD9vXNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368346; c=relaxed/simple;
	bh=ifjHrypS8OaIbgMtrNppOarqjtvx73eEWodHO2AKcL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G1v229ADPGNVZqu3R8J5mHtSPCyR8ZTAWBbTHLyi67hHaz0NwY8rhWVTQIdRYDva7990GSYS/Rd/m3jK13CRVSFrm4PlkY6K97OjVwdLhVaIEnImxaRr40Ihfkc+UdDFA+9QyQmkI3svU5u+p+sfP3srxuby2g7AvUU1i718x0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzETRaPf; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzETRaPf"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4d870d54so870102f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 17:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368343; x=1792973143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifjHrypS8OaIbgMtrNppOarqjtvx73eEWodHO2AKcL4=;
        b=SzETRaPfKQMNltNSIxIFcKzmuD7c0heArJL1JqAy7Vwj+sCdQhpHjHA+wbGAvuca9U
         +qX6t6ftynOuTi7PEvqcVmlAmlwjs9MnykHEOMhoLntxIDGvqXFmMwVJHV/jmi/ksjUQ
         o40Kd+9D+SjIcVB3dZGVrN3uEvNAoBARRP+UqnITbsn8OCRufW72jbDPb6QQZUNXUrVB
         a1mzC5hX8ZTPcfBrrrFaYaTnP6Ey4B2n9ilDmurKq6v3HZWo1zdQ5qTBl+xo25amBUVz
         HAmCZWOqxls/DHqr/HXwVXloxEvQ146IqfvzsnKCyvEm3lBO3TsIhuQUAYK3cWWdU+PZ
         q2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368343; x=1792973143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifjHrypS8OaIbgMtrNppOarqjtvx73eEWodHO2AKcL4=;
        b=NJETSfWcD4on88/vVlS8z0JonBJorAp0UjXg0bw5aR17B4sgtVf6jCjhYI0IqmbLMs
         5h6NipXhWcyZZGFFat6U7UI7BQPYRpx52u2/7fz34PanHqg2c/BsDZw/d8WFbukVq2p+
         0ht8Y1se2TV6uLKEYaxNlvk2IFr4Q4/83Ehuw/eZeHNs9wCSOUAdU+u4aErd9fOQ4oID
         2Ju1BlnHNtRwKdG6iqgqdTNpFbRDjE3sJqKmGOmNBP00nL+0rWYrbNw0OjF93CVWQjxl
         FkSDhen32fNUS89aBXjR0w4F+ND0GCpc6cForxY/fhZNoVX6EuBG6e2Q7gZr3Kg4UYBA
         mvZA==
X-Forwarded-Encrypted: i=1; AKwUvByMyXy/DmgpG1vJhSTCbtsA5iUaK80l2DFbil9y+3U2lkpAISMIyt8UrLsDjBZ9x0MWLp9RrS/yb2R/U/X4@lists.linux.dev
X-Gm-Message-State: AFq9FYJ0rYcPGkUdhWH8SgL2Ao0lxf95GJsfV6sJVOVhGWWyIOzQbubI
	mW4Kgic/zR0JsiX3ScbbXPeO3FgpIV4ytR61V1AtoJPrydT7y54gtBR8
X-Gm-Gg: AYBFou1m91Ymk/iZqsXFS1r3gx/92be5kMt/APMEXzYyQoGGrifgMR9HQV1sAcy8hMJ
	qZKoIjkUOeutiZ8IYsGWd1e7xoZ6NwwClMziMriQdOTtT6yzVbcI0LDGguwxNgndSmGV11MQ5Pq
	ueG6gThStNvSA1Frn4qbaP4gOJngeDLtjTyUeJeimeESg7VaUZ4B16D/U7pPIQZt6gQZxBTlLPO
	MShXQn7/5ogSxOjzs5tp+l7oepTlr/illpQvo0frMGENOUjlThoSdpAg9UjzOOra3JXQCppyvKq
	IsXxy6hZM4QfB5OoKy9yGpFBTrlt5afdt3Ac78baCT1NAsbAzhGCjq8KjW95SoLAb5Ag/1W5Ktb
	q/JKyswVWIA/wEgJY7e5Z26FseIaR1e6qPjgFjSpXcskSGV/xKHvewvjduO1QU7+EuGfUVZXtme
	OnOeT7OsSla7HSqf9McpHDKSoYUqm+lmiB5q/kErd12RmiAms0X2aps8gKV6RuU7mdPbbGvC8kB
	GYm9qf9lc98eAo01eZCEoeKTyk=
X-Received: by 2002:a05:6000:41cb:b0:48b:10c8:2181 with SMTP id ffacd0b85a97d-48e07f9a2b1mr10996069f8f.27.1792368343069;
        Sun, 18 Oct 2026 17:05:43 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([156.213.131.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5038b8sm19923438f8f.48.2026.10.18.17.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:05:41 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Remove redundant zero assignments
Date: Mon, 19 Oct 2026 03:03:10 +0300
Message-ID: <20261019000443.753-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026101838-oaf-bobcat-efa0@gregkh>
References: <2026101838-oaf-bobcat-efa0@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Thank you for the feedback. I understand that keeping the explicit
assignments is preferred, so I will drop this patch.

Thanks,
Temitope
