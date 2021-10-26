Received: from smtprelay.hostedemail.com (smtprelay0246.hostedemail.com [216.40.44.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26762CA4
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 04:30:30 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 51B2E8075E92
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 04:30:23 +0000 (UTC)
Received: from omf01.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id 0B9871829805C;
	Tue, 26 Oct 2021 04:30:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 9DC7917276;
	Tue, 26 Oct 2021 04:30:14 +0000 (UTC)
Message-ID: <8a28c2abf1857c631bd6af52364d7f055a6c0ee9.camel@perches.com>
Subject: Re: [PATCH] staging: rtl8723bs: core: remove local variable and
 goto statement
From: Joe Perches <joe@perches.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>,
 gregkh@linuxfoundation.org,  fabioaiuto83@gmail.com,
 ross.schm.dev@gmail.com, marcocesati@gmail.com, 
 matthew.v.deangelis@gmail.com, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Date: Mon, 25 Oct 2021 21:30:13 -0700
In-Reply-To: <YXeC8q6IooA4N1ZF@Sauravs-MacBook-Air.local>
References: <YXeC8q6IooA4N1ZF@Sauravs-MacBook-Air.local>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9DC7917276
X-Spam-Status: No, score=1.60
X-Stat-Signature: rqs99ogcamans6mwa5jtuzrr116szy8u
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19mwDJx49hqd+DvWov5aICK54jupwZnYlQ=
X-HE-Tag: 1635222614-65343

On Tue, 2021-10-26 at 09:54 +0530, Saurav Girepunje wrote:
> In the function rtw_validate_bssid() remove the goto statement.
> As on goto exit label, function is returning without any cleanup.
> In this function goto statement can be replace by simple return
> statement, which will improve readability. After replacing
> the goto statement local variable ret is also not needed. So
> remove the ret local variable.
[]
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
[]
> @@ -24,15 +24,10 @@ u8 rtw_validate_bssid(u8 *bssid)
> 
>  u8 rtw_validate_ssid(struct ndis_802_11_ssid *ssid)
>  {
> -	u8 ret = true;
> -
> -	if (ssid->ssid_length > 32) {
> -		ret = false;
> -		goto exit;
> -	}
> +	if (ssid->ssid_length > 32)
> +		return false;
> 
> -exit:
> -	return ret;
> +	return true;
>  }

bool rtw_validate_ssid(const struct ndis_802_11_ssid *ssid)
{
	return ssid->ssid_length <= 32;
}


