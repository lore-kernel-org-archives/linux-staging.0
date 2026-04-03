Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D08629BD82
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 03:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775186586; cv=none; b=FGbxvsGsybfnZnFc03VHK7AspZApv1E4YI6XDkBx8rgHftah7Ei88F/KtrJzNdEMz+QQPWla9NQxQP4cfQBAZYSLrX1PpOwlHZlrPqH6W39DXiTF1GzblyRMYGCWAQBsvm9AkBxfkIPR6Dyp312zH2VIpPzkknY1bRo8yH6VUrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775186586; c=relaxed/simple;
	bh=SUEEMCAksM1sc1K8MV8911uff0cDqOJihY9evqB8dgc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=QXydt1kYbpL/n+7yy5BsbFPuwHAhAIEppSeW3yI8TfKNrHwM/kZETIHvGgFivwwYtMnQzQUK5L6av+/DqSZe6SuihYLm3BPF4vBTjx5AGGmB5bk/FWBh7QnVW6OwCRckvbUYQOT8Sw53qKMC/Fx3VrlkqwddVWT12KSAP6Bq7Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qx2G9pSD; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qx2G9pSD"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-799001d73bdso11946997b3.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 20:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775186584; x=1775791384; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUEEMCAksM1sc1K8MV8911uff0cDqOJihY9evqB8dgc=;
        b=qx2G9pSD4T+gjxzoK4VGx/1yiXpk8y8MpncOpAgpSUCRHhrFm4EtmKt8fRVqKfBzop
         PqEYX85VG/ADqtKveeA0fbnHdL3SHKdfOsStpr03A3qYgtXxEv9oBh8PqQ6tN059dfoE
         1CtVNYtYrvSgKFuHblE/EB5femw5tDyDFbHrIudvhIHdgSy6vWtj8pdSViS61rCY+nr/
         VQEWt7I+jHMHgVbBAtnXTvHE+TFocggNB4SQz5Wy8+eTZtD1sPqc9dhzqhv1M27gn10T
         32/8mzCaZ+yMAJW9C0vcmH0vbPx9kp2in/9fEtUMWVvu88UBAHAmwQ1/lMKCKzbri1lD
         KEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775186584; x=1775791384;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SUEEMCAksM1sc1K8MV8911uff0cDqOJihY9evqB8dgc=;
        b=QQuEtVmhIGa/d1P3F2T0gkIllFyBvEOx/KXWliZMfGOzgyvA8hKYTlkeHlJOndu2s4
         dCRQwttyI1EcgWDhAhNdQIzt9huuMTVy+ea9tqEDwKq58dNDlDfZ3sVmixvlDKQRejt1
         nvghUUbleub1KrrXbOswTSMnaEp+2b5At8vS3HwiZVuhISc5AzDWH8h0IsRwTUWnKcbl
         4RfLZa3YPWfPo0WYNMGSI+4TIMRV6cxHo21aCH0cZLsYmpBR7imSZxxYIUrm8qZ0Vnc0
         ViLCClyumjyf9ophS0g6kNr07lui8MMhy6ey2QZbts3OF9abD7fcCSJReq0kAnQBD4HS
         5MhA==
X-Gm-Message-State: AOJu0YyiL9tW5BtWdgCVNCFj8SgcEboRY5KWOSzqtrvbmwt/dfEX9i3y
	q+9Qx4TBsQSbJ7HYtF9XZdayYD3eFO/XJtf7RX8D8ZpMMQ4MrSZcrtFC
X-Gm-Gg: AeBDieuJqu2Z+yNX0SzBI2ogZlS/L+3GKn7vSBaM2KA2IBBDQyB4YqPEWq4XhsbgLmc
	HxeZ+GorVehV/Pj/hyxalYorp0ZSgOxGSr9BFkYq4Qf9HwV0TYYjmJwMedDUeuIUzsmwYr/1rlg
	iEj70lty49s8sXtnCtrQE/dxQH35nedLezVFn23p3Cullvpr0QbsuzMLF0d+b3tBb8JmFfc4XyL
	Q9QVH6WQgJS+pSuSiLkF/KBJpO0gRXSjPRZHgHlBj1I35zKpD5at3DZThYL4+ddvVtwPn2EtiQ1
	U23lSslIHaQMkj6p7RbLK0wV1fqGAZLZz9PUw6voruiLsyMdjXaRP0IP2uL2JB6nG/Azoqc1WP7
	+hzafgSmmxQveNh9VKzWybD1DwJRtp7nwyj7TbFXzaOkn1UcENTwwkVX8Y1kiZCackRUoxHFNYi
	kjj+xCno5u3yomnntL1A22wLU5mh3dXhR/wfKXvm4y88K3pEzZH5uOFoDm6uF/rlKpa/zMWR8Li
	tyzvACIWg6PmGYasnaMNptGr/cLsorR
X-Received: by 2002:a05:690c:e3ec:b0:79c:ff02:a03d with SMTP id 00721157ae682-7a4d35d5df3mr19430007b3.10.1775186584230;
        Thu, 02 Apr 2026 20:23:04 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e320670sm17705587b3.2.2026.04.02.20.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 20:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 22:23:00 -0500
Message-Id: <DHJ74GTN2YZF.233VZ3LGY93UC@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses in
 os_intfs.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <straube.linux@gmail.com>, <dan.carpenter@linaro.org>,
 <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260402231316.4243-1-dennylin0707@gmail.com>
In-Reply-To: <20260402231316.4243-1-dennylin0707@gmail.com>

On Thu Apr 2, 2026 at 6:13 PM CDT, Hungyu Lin wrote:
> Remove redundant parentheses around &padapter->xmitpriv and
> &padapter->recvpriv.
>
> The parentheses are unnecessary and removing them improves readability.
> No functional change.
>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
