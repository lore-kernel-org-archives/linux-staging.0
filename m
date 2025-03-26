Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8009817F4F6;
	Wed, 26 Mar 2025 08:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742976366; cv=none; b=dXA+QPMVR2TBd6v+dj3VJJ9tT79nfhAP3KGuRAtYnHAjowWLIPy9tDBQKC2U4uwjF5EgPdqKh1zXb3tjDryYr2kPGlhTWkbc/Vslvb/FxCZy96UrHGu+Vk0hMJKENN1aaUwtd8n+4x3putMkflWphofyPWarEfNX9OB+MZEwfTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742976366; c=relaxed/simple;
	bh=fqtSiEWbdl9KiKlUVI6o2a5Tgr9ZxuUybi/5ay+aAMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iL9LKzLnS1gt2zY5q/nLNWBeHHRQXgopzfIOuabJQewTaOf7JnbIHjplL6Kw0yAf6Ni2kgtG1oyYk3i6Oz8OjlVI1c/dOokgBJsoQk8OJ4iyFbDf5F9mt9i4oby6f9C/PPauEgfO93LGWS+XdVYXBF4rOLtL3ocBUVSffyML8Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M28GtHcv; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M28GtHcv"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-524125f6cadso6551575e0c.2;
        Wed, 26 Mar 2025 01:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742976363; x=1743581163; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kOvyvHEvdUACqpuxrtSqWcuiONSkskfUshgjr8oC18=;
        b=M28GtHcvtxDFVIwky1cVWtl7cY7waw/IekFgCiSdFOgJwwlYl07h2xEv8HcuPPOrN7
         BJbV+1xe5/78h2wTkzlVYTCNZ9/STXbff8KSVIpv4XHYvgIMEh4Hi5naMn5jn25ZKVfn
         2mDt+dDECXlj6lYealIwXgBOPv3v+6GjKHLgztbsWgLom5DF3IcPVIsRxCuCxQ2jSD4s
         svJ9BvC3x9hOns/pNAB6gCsZFoI5EaNT8TQQMuVeunZVRgBcIoMTIqsqUJqrDKUpE+UP
         6jGxE0/T2yid2SmV8g+pVk8z2PQsTw/miol4N1/IYxP59poMgtaIsSxoXBTYU4Q+COib
         VTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742976363; x=1743581163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kOvyvHEvdUACqpuxrtSqWcuiONSkskfUshgjr8oC18=;
        b=DFwOWi2Pdn4tChsKS5Ik9LQBNXabHck+JnSoTX+9XljrMZtLPgfo0bzWytokD8tv0P
         5wYogqYkWKvHBMnPsyG4FuaapRZXCKjmHZqoiQtIg7IhZEA/+NqksLcVDr38lYyqvEph
         V7muqw7kJKzNNnmUnVFNKp4QjAbAJGdADgEkChabILV0qVq+uP3BcGPsv6NcwfDNsAPh
         jgcudTOu91xebMFK9hroClkVHAOOmRPnevbo5UAJensZAxnvcb1ju2ZTswPOPi/9MX6M
         MCTSgzjKNoN9ubfT4LhOYRtzJ+NEnDzhpfVgBX/5XezQx9qd0phZ9zrACSOLyaEl9MRq
         V0+A==
X-Forwarded-Encrypted: i=1; AJvYcCVHft0le6mHujb4dwRmzQryxmCNP5+8DxGjQbV5lqWIJtwcsNTWwcFtpVs5F15DMPo6BYpc4I1br5dE@lists.linux.dev, AJvYcCXb15kEeZlss5OX0iIpzJcH0jBSpsL/RRbpmn+WLP9XeqoZA5Bk7AM4PBZjTDgOH3Y8fpUW4Admx1WbU8R0@lists.linux.dev
X-Gm-Message-State: AOJu0YzssF3uxapd6EIB7x6rMI+ClMsVH4lqUm8ztUFGNcS2rynPqexU
	SDQTXeuR4z4E4q6CbKAM+CQ/qEBB5eeiV9E1HjmpZUpXsifGWgZFYeeZZnAcIpveCFULF8fj3an
	ANnc9DNhwyAAqm8cVds1bCLstewQ=
X-Gm-Gg: ASbGnctqtSk0OJKRypee8TY16/D5capjDTvv8jKDWSLEq/9tVUgGbRRLw/zNh17CNCt
	LJ7mWMsy4wrC6u64/zHFqnPeyjty9iUMR7+3RJR1Mb2NBhOFnPixNmiFaGuYnTTqVJsSoDPS4n0
	2gq5gHbkcwlI2ldUuKNKDLW/rX3TV+
X-Google-Smtp-Source: AGHT+IGaiUxSdccFQaMvg9pATNqqdFgJAcbDNlosomR26XlILMlL1OYPAoti+ujrGnDNnglOHPfwSS5rvk/fjhuHNic=
X-Received: by 2002:a05:6122:8c28:b0:520:98ec:b25c with SMTP id
 71dfb90a1353d-525a82fdff4mr13652666e0c.1.1742976363058; Wed, 26 Mar 2025
 01:06:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326072842.10344-1-karanja99erick@gmail.com>
In-Reply-To: <20250326072842.10344-1-karanja99erick@gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Wed, 26 Mar 2025 09:05:55 +0100
X-Gm-Features: AQ5f1JoXPSOYVI_4jAAKLke1z-SXr8TqUC6EwQn4WF83GllMkHGlgl-V0RTLN8g
Message-ID: <CADYq+fa2T5k73ckaTgW36wM1BMNRQvYB+oO2fGYFOjvLH76WVw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: Rename variables
To: Erick Karanja <karanja99erick@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 8:29=E2=80=AFAM Erick Karanja <karanja99erick@gmail=
.com> wrote:
>
> Rename the variable `mediaStatus` to `media_status` and variable
> `lpsVal` to `lps_val` to adhere to Linux kernel coding
> standards by using snake_case instead of CamelCase.
>
> Fixes checkpatch.pl warning:
>         CHECK: Avoid CamelCase: <mediaStatus>
>         CHECK: Avoid CamelCase: <lpsVal>
>
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---

Hello Erick, I think what Julia is explaining is that you should write
your changes in v2 here where I inserted
this message to you. Not to remove it entirely. Am I right Julia?

Adekunle

>  drivers/staging/rtl8723bs/core/rtw_btcoex.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/stagin=
g/rtl8723bs/core/rtw_btcoex.c
> index d54095f50113..f4b19ef7b341 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> @@ -8,14 +8,14 @@
>  #include <rtw_btcoex.h>
>  #include <hal_btcoex.h>
>
> -void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 mediaStat=
us)
> +void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_sta=
tus)
>  {
> -       if ((mediaStatus =3D=3D RT_MEDIA_CONNECT)
> +       if ((media_status =3D=3D RT_MEDIA_CONNECT)
>                 && (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) =3D=
=3D true)) {
>                 rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
>         }
>
> -       hal_btcoex_MediaStatusNotify(padapter, mediaStatus);
> +       hal_btcoex_MediaStatusNotify(padapter, media_status);
>  }
>
>  void rtw_btcoex_HaltNotify(struct adapter *padapter)
> @@ -52,14 +52,14 @@ void rtw_btcoex_RejectApAggregatedPacket(struct adapt=
er *padapter, u8 enable)
>  void rtw_btcoex_LPS_Enter(struct adapter *padapter)
>  {
>         struct pwrctrl_priv *pwrpriv;
> -       u8 lpsVal;
> +       u8 lps_val;
>
>
>         pwrpriv =3D adapter_to_pwrctl(padapter);
>
>         pwrpriv->bpower_saving =3D true;
> -       lpsVal =3D hal_btcoex_LpsVal(padapter);
> -       rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lpsVal, "BTCOEX");
> +       lps_val =3D hal_btcoex_LpsVal(padapter);
> +       rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lps_val, "BTCOEX");
>  }
>
>  void rtw_btcoex_LPS_Leave(struct adapter *padapter)
> --
> 2.43.0
>
>
