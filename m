Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273563D330C
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662576; cv=none; b=MGHjb5Hj+/MG+6DE37glDRbSCv7Uy5znUCkLEgoyxY7yGhxkHfYOFU7vAub6+Lpg72hb1ZIhOZSuXt3Y8d5wDJa+EQKWnjkAgThDDlMjXEobrYUzLM6mNQghAyCtfG25RvTS5+XcBJjknfq26vxwvJUlhJ76uwrbSyOgwkiyjmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662576; c=relaxed/simple;
	bh=kqZywkIsscC9f9Z1is+LPC5BgpYTNULeR8A2PMKvXsw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Aexhw0rDjABwbk0vHpeTsEonUgMYoaAxeoQ7omFiKepQhQ2x+xdxIdYtuMPgesVTwIp85lbGedfrzmxQ+uz4BHk6DjqECoIzvgsAsfBCesb59WDQRsUWywEI1xx/a7YdWJy5+OBaQyvpmwgfeIG5oxfxgSjxnPBNK79pY5wlLFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YecuknV8; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YecuknV8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775662563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgUVd4jg1jC1fzX/AqoYl3RKhULhGCuA6b1+mrUe3lQ=;
	b=YecuknV8P1nMaLJsKNn18ABBC0Z1MphXW8UAaJPKjmYSf7ZzJnTeJTQV1lv7FIYrWx/32n
	Tj1vDH3I7bhcuOZVLt1hJhxqUp092+KAbqxtX+7K0AWXuDXkepssjdLdWMziHi00b7zKIs
	Kfm+qpmyB2pS5a13sYuDC6RPsoaiWjo=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 17:35:57 +0200
Message-Id: <DHNVUDG14KDA.2HMR5E1NLSZ56@linux.dev>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <dan.carpenter@linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant returns in
 rtw_mlme_ext.c
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
References: <20260404114802.11242-1-dennylin0707@gmail.com>
In-Reply-To: <20260404114802.11242-1-dennylin0707@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat Apr 4, 2026 at 1:48 PM CEST, Hungyu Lin wrote:
> Remove redundant return statements at the end of void functions
> in rtw_mlme_ext.c.
>
> No functional change.
>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stag=
ing/rtl8723bs/core/rtw_mlme_ext.c
> index dad1d95bc325..335f5b2c96f0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -2417,9 +2417,6 @@ void issue_probersp(struct adapter *padapter, unsig=
ned char *da, u8 is_valid_p2p
> =20
> =20
>  	dump_mgntframe(padapter, pmgntframe);
> -
> -	return;
> -
>  }
> =20
>  static int _issue_probereq(struct adapter *padapter,
> @@ -3877,9 +3874,6 @@ void site_survey(struct adapter *padapter)
>  			issue_action_BSSCoexistPacket(padapter);
>  		}
>  	}
> -
> -	return;
> -
>  }
> =20
>  /* collect bss info from Beacon and Probe request/response frames. */
> @@ -4414,9 +4408,6 @@ void report_survey_event(struct adapter *padapter, =
union recv_frame *precv_frame
>  	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
> =20
>  	pmlmeext->sitesurvey_res.bss_cnt++;
> -
> -	return;
> -
>  }
> =20
>  void report_surveydone_event(struct adapter *padapter)
> @@ -4458,9 +4449,6 @@ void report_surveydone_event(struct adapter *padapt=
er)
>  	psurveydone_evt->bss_cnt =3D pmlmeext->sitesurvey_res.bss_cnt;
> =20
>  	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
> -
> -	return;
> -
>  }
> =20
>  void report_join_res(struct adapter *padapter, int res)
> @@ -4549,9 +4537,6 @@ void report_wmm_edca_update(struct adapter *padapte=
r)
>  	pwmm_event->wmm =3D 0;
> =20
>  	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
> -
> -	return;
> -
>  }
> =20
>  void report_del_sta_event(struct adapter *padapter, unsigned char *MacAd=
dr, unsigned short reason)
LGTM
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
