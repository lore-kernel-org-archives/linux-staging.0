Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0FC31F9B8
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 07:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114056; cv=none; b=XHEZe678FdR4b/0vtzTMgfugzzU6nnLGSBTFJc+KfrfT/wg9tJaKDfFe0E3wsSo/9WlBqMzCk+ciZ0NdN+AQkY+LthcehzLFXCJ4/ch9zyXoAGWaqqRclyWuKBNNKdlv6VE8QVCHH/c6pESZWUMlgWhOB3zLUGhhqbQl5Tf3ShI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114056; c=relaxed/simple;
	bh=/Y0wK1DjYHCDfqnPqGoeviCY5Z0746wIceBPkmgPE5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/t14FJCmU/2l16WTYiLVo6zzn00VyDrextppCRdPO5JDohoAHqRFG1fZHqfOIY5ktUv7cVgNLW9Ol/K9rgiyTlxcjoqL1zv+X+LjhvGZt2Q1GjpIrY1Ba964KahJX6SraJ0QWn760G+Wuoag2eo8iWf2bKt95Bfj90dQC9a1Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVyFMm4/; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVyFMm4/"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43cfd96354aso318848f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775114053; x=1775718853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4DL3TNu9MpIP2feemW+kpE1U6+jIZ/jDYv1Nlo4q00=;
        b=TVyFMm4/HsgAAur66nHoIbllvK37J1e86eAcDA344LaAH3usotPMBQ22TBPSPVDz5v
         pKhDD5T8I1NGiWtwJeAckX4QJ4lryUM0kUukLJ4wgAMaQdNUrIUpkZhcOc9oiu0PR/lh
         QdrCfZtXEOVi2wABi50ZJCwTHh1Ok7aT0+sztAAvLsbL5h78sxGVWsHmO50WwEgzh+nC
         TPskAkjBnlYWEB6jaJctnVdJf550YM5EdYRmpfqc1BHmUUD44X8Oj4uh61G1ACRRDsx5
         S/es6F590jMK5e0iLVhXmCXJ0PWvBdOO3dPp7S0nw4NfjFjLXyBfMBHD42wwH4dWnJuf
         j07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775114053; x=1775718853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D4DL3TNu9MpIP2feemW+kpE1U6+jIZ/jDYv1Nlo4q00=;
        b=WJ5KUF11t/CUxqCn3m0Vvf0ycTK+kPINFGU+xT+xxZuaoixVxm6flF763Ew4DChgUv
         ILZgvKx/IfwPdBPko9ZTMqm2F+bugj3zZR6FcZooFWU4hGY2FNOWK6bN1G3bb6FCUVs1
         htSORcDv6YERcurRYrjsLhQ0/yTV0tUFaXPij4Wpc0TxM1PM0D48pWmnni1ebnKTZQ4V
         GO55iVyb3um6WF6uVqAzzhixcflQ4dN2YLDzJj6CU3R4ox4fhHkqh25Yt2MaV6s2DJt2
         8RAP0lEhl28/EQh8WJC3c70LzX8IFSvkoa2Lhn/reJ8SGM6l5pyZneY/4JtC2OwIPrqX
         lAyw==
X-Forwarded-Encrypted: i=1; AJvYcCXMSUKjbKy57h1Dt5fukgu4ghD+TpvsMoF0fy0YO8p+j5eH5rT73VJbZrdljT/V9a+sfLE/58QCxS8/NG26@lists.linux.dev
X-Gm-Message-State: AOJu0YxkjGnYVVoO/MIpnRVajA6ke8FMDBAv9jDeqYrIrWVv1/V+9DT9
	gAa1c9PaZJMNWo/rbvNXXF8/tEdQblbRiFW3hcxNt63a3VlgCsAQnS6+7Tl9eSQl
X-Gm-Gg: ATEYQzwXD1XCwmLCrjRIr0CU+3vAZmLAIHfSVgjw7O6W0hmOGEM26hyNA8DEDR1rWaL
	KN18vhLMTZT/7kRCBoejOndGgcLV5Reqvpt5hbXjkYm6MZuKN0aqzl2G0aEketwRSryEf1AYhfS
	+FlriTsbOUKr2IKqw0p8tbevvfW407eoyuC6xpi4QvVS6tq4NYAqREYIA3bVXlzJXRDt2qNd2PZ
	6NP6ViFGdiRoGHUgjQMzdKyqo0GqlUUJv89pgMKgsO1YSkLJ2hR3o4YoF3o66OTrcQC3mV+i1Ob
	oClnx9RJhlaXbV+t5kAYZ98AHWbGZZPPTgMXz+LHZP4sYM65OQtQsPbh/NC2rcClZbz5U1laIRF
	1VKVtc+FsWk/MEFXEWJ8tkEM754L+ymZr6LxCGFxgQ7yXjiWR3iaiNddhC4GLVooqIq2h04A841
	5S4iiSeJOdadBvjknAPg5R
X-Received: by 2002:a5d:5d0a:0:b0:43d:127b:7e81 with SMTP id ffacd0b85a97d-43d1f233f58mr3861693f8f.28.1775114053190;
        Thu, 02 Apr 2026 00:14:13 -0700 (PDT)
Received: from bera-arch ([2a02:ff0:c13:2eeb:2e7c:3a4f:2bc2:f78a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5419sm6443738f8f.11.2026.04.02.00.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 00:14:12 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: tommyguo039@gmail.com
Cc: b9788213@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: remove GEN_CMD_CODE macro and callback array
Date: Thu,  2 Apr 2026 10:13:37 +0300
Message-ID: <20260402071336.12211-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402023621.142194-1-tommyguo039@gmail.com>
References: <20260402023621.142194-1-tommyguo039@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  1 Apr 2026 22:35:59 -0400, Xiyuan Guo wrote:
> The GEN_CMD_CODE macro and the rtw_cmd_callback function pointer array
> add unnecessary layers of indirection and make the code difficult to
> follow. Remove the GEN_CMD_CODE macro and replace the function pointer array
> dispatcher in rtw_cmd_thread() with a direct switch statement.
> 
> Additionally, rename the associated command enums from CamelCase to
> UPPERCASE_SNAKE_CASE to comply with the standard Linux kernel coding
> style.
> 
> Signed-off-by: Xiyuan Guo <tommyguo039@gmail.com>
> ---

...

> -#endif /*  _CMD_H_ */
> +#endif /* _CMD_H_ */

This must be __RTW_CMD_H_ but it is competely unrelated with this patch.
If you want to fix this you can send a separate patch.

Thanks,
Bera
