Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7554C223DCE
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 01:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775007608; cv=none; b=QBWeVNjDHvx4r5HUabyL5GGAzERLvTpuVE3/P7YqhH+x+MY9BQ/sezcbq3rFVwKVrUHRrUyyiyX4fmbFFUa8ohotLrUrJBd37AQTG+OgooaT9IjpHDfRzlBEHvZWZRhTE4g7X2qB5VUQyKKDHgqNJKRnTaqhoScPXB7fvGzSp4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775007608; c=relaxed/simple;
	bh=pqz3o/rxy9WJ3YvbziOVUyh/gkw2NGu+IJUHKl3dvqc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Dfsl5EBF10eskk/lTSTJZbL0ZxZaXXQCkoM9wZNOlJ3SGKcGL/vuSs1N7P5wfRFXI55yU7kQgOUl5NA9ch1qvdQmOYhFnHkpaKGcP34KMW4Fe3VBgp329lZyXKHbeji+jlUUa9wuTqSiJCbFBsnM1Jbp5sFKqXNurzP/oMACXQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgAnf6I8; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgAnf6I8"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79f855b2575so3648647b3.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 18:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775007605; x=1775612405; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXQNpeQf/PiTzVseX/tskZUf+TiWiKy17t16d9yvbT8=;
        b=bgAnf6I881riyjSKbmlS+/dPJtHItT8BHhZlQ9G+rxAHurv5rjW5rm3YpeUS3QC2Xv
         265iW+JIXLipBAUk8w776X8PHM2WB4mAg1IpbeVCIOk1PSQkcruTKZPcjRE/2nYexlsl
         CDlyhSiX9A4A97ifQmyZMDCMmVcHOzLwtHv79kYa7yUmZXXUwsljpj7a0+KNiWHA9FBF
         Bm/7BgCNtqVo4EHcFy5XH2IFWGn2TzghNKhmjzJb7eLYQ+YRk3/ZmkQ0nKca4GwmCWxk
         MH6ksLSS/Ns/sujgbEgGodxrmk13OU3pscTgMYfcIeFXEJZahf1/bfdqpyTJqra5nRuM
         kTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775007605; x=1775612405;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RXQNpeQf/PiTzVseX/tskZUf+TiWiKy17t16d9yvbT8=;
        b=KJcGkl3zWipfflmStZ9n50UrdHpobxhqrJagn4CLy6bVYmU0QkUf5x2dw/Qx3KyvQt
         mzt1gkiJ9dHsLkx7PlHTayg2/RHk5LXfxBjix7uscjYlqckWmZrqUq0H5TXyyjaJcIWL
         PRWzr+C2r1j/ruPyqKQOnRn6inycL8yKLLzkgdnZbxJjzy/WX4XL5ZIXL4G+Hj8OEXjH
         WwxcGosLPll6eYkFdEbzgHi8Bg+8i9R1gV7uFTxXIrGekE+Lj9v8+tl3OWkgDez2LX7/
         FgNLHbR/QWnNq0tJ2tsn/M1MMhUVZE1D2IV8s/9GXdCH7HezEv8UtkvLFovFQPvDqSsJ
         JCIA==
X-Gm-Message-State: AOJu0YxbYikqPW5yQVzKF6/xPYHHmFzvDdw8a3dX0DKTPEOBPg62Lges
	f50VmO3T7IkRxqBSLluJDHv2Dqz7OQjiqjphgpp9xznrc24JqN7eQBxW
X-Gm-Gg: ATEYQzwRIeRbRuIFK9dcoqbQJybrUW0S9SvVmVqvDHpF09aSDKp37yiycbo1EcnfP4r
	MyQSaC5nxMi15mmIucA20JZYTGbfcS+DC/iI05rp0K1X57qQZl9OmlXObDddAf6MfNNurKl6DE6
	Cy4AROQW2nhsOf+5HVhgIDLhNEpz7LOgcmZdAddCsO4rZZY+ibbDXmrEeYEni/GWIs6A/wPS4XB
	bxTdHtapxCyQ13goA3kqMvDOXBCaMiA0ZZnPXUDOfWMJj3EPiYU5LF46uiiykVuNyXF2XJiGKMo
	iFrZZCGVEBh0OxeK+wAzQyUcPlwJiamB6j+RO4b8oedfBdEsXYp/+4rEdMgYM1PYqiGbHjMTjXr
	OMXCHZW/xsstZqF8Z5feK1QZo4DVd2sZBZN4FQI/9cxzcmQApfU/IkWJqVgGNyw5lfDoJE1uh9B
	qvqK4wP4zYPvTyHFAsQAUU7NE1ZTmPHySC8Cqs8klHNktK54ZenOdLYk3blgBmrGapLciZ5Isdn
	bUGyUukg/z5U5h4sP8jibVr6rV9taod
X-Received: by 2002:a05:690c:e3c4:b0:7a1:6e8:d8fb with SMTP id 00721157ae682-7a2104a4956mr20607237b3.3.1775007603936;
        Tue, 31 Mar 2026 18:40:03 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cba0778acsm56922757b3.33.2026.03.31.18.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 18:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 20:39:54 -0500
Message-Id: <DHHFOFQTXKTU.3JIJQ1L0D46AZ@gmail.com>
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Omer El Idrissi" <omer.e.idrissi@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
In-Reply-To: <20260331153255.22764-1-omer.e.idrissi@gmail.com>

On Tue Mar 31, 2026 at 10:32 AM CDT, Omer El Idrissi wrote:
> This patch series does some general cleanup for rtw_sdio_if1_init. Among
> the changes are: using direct returns, removing the use of
> vendor-defined macros, adding a separate label for freeing and
> unregistering padapter->rtw_wdev.
>
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
>
> Omer El Idrissi (5):
>   staging: rtl8723bs: use direct returns in rtw_sdio_if1_init
>   staging: rtl8723bs: remove useless line in rtw_sdio_if1_init
>   staging: rtl8723bs: remove use of vendor-defined status macros
>   staging: rtl8723bs: replace function with error handling alternative
>   staging: rtl8723bs: add separate label for freeing rtw_wdev
>
>  drivers/staging/rtl8723bs/include/sdio_hal.h |  1 -
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 56 ++++++++------------
>  2 files changed, 22 insertions(+), 35 deletions(-)

Please add "staging: rtl8723bs" to your cover letter header. I have a
filter for rtl8723bs and not getting your cover letter was very confusing.

You don't have to resend the series for this reason however.

Thanks,=20

ET
