Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A4F3C6A51
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781045; cv=none; b=pPwzWcyOY1QPlhSsKqJ8X9DSLGoodP3MVp7rTi4ob8J9aGiSGOQZyzx8Yama2nw7dK8aduLh+WgpyGREfjHWTWjIfmlSePTmgZVeZ/BWF9INko4fOW8GhDIQR2Cg9w7mfNTACjcf6ilZB1WLZgqQK166N4ONRiynaMcoXtpVGJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781045; c=relaxed/simple;
	bh=aeQbHBFw9PbI7L8VylK0ECn3qjtSQJqMlmUWGUnPA68=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=uHi0GSruNA3+K1dhZVIu3AWpXeKTrTHjJc6X1NjQ/60XUV1QGNfpwHOeUpKP07RT2pqzRp+m4//KLRcx/wOVvpyAAlgksRfuMCMYkkvxihecez4AWUUEoJumAEAqbH+N4Xm4xySbPrNNARGzoB0VH+T7bejsS5f9j+dC6eH0V8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WZINrV+H; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WZINrV+H"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776781040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iy/End85izE/cHmVI9h01QHIUyQoz5r2IbBZc+tX5KY=;
	b=WZINrV+HrsFqjW+2iIj9VL85kcvKvdx/nJsjUZiPxiceDlltR8KOteLlGHuW/MX13URQGI
	ugAsoYKreLSuIHdjQTdkgPqkaW8J52sUsljcYbFM3KiIsI5/iP4uM/aKGcPCDlUGkuQANF
	xcVw5F9zZnf/0PazNFvC7IjoGNNXtcI=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 16:17:16 +0200
Message-Id: <DHYWB7OYX3LJ.30L4BEH5YUOKM@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Shyam Sunder Reddy Padira" <shyamsunderreddypadira@gmail.com>,
 <gregkh@linuxfoundation.org>, <ethantidmore06@gmail.com>,
 <straube.linux@gmail.com>, <dan.carpenter@linaro.org>,
 <samasth.norway.ananda@oracle.com>, <vcaron@bearstech.com>,
 <adrishbora@gmail.com>, <ofirmirovsky@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: os_dep: remove redundant else in
 rtw_dev_unload
References: <20260418170908.16257-1-shyamsunderreddypadira@gmail.com>
In-Reply-To: <20260418170908.16257-1-shyamsunderreddypadira@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat Apr 18, 2026 at 7:09 PM CEST, Shyam Sunder Reddy Padira wrote:
> Remove the unnecessary else block following a break
> statment to simplify the control flow and improve
> code readability.
>
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.co=
m>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/stagin=
g/rtl8723bs/os_dep/os_intfs.c
> index 29939bf5a156..3207d6d2c727 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -988,12 +988,10 @@ void rtw_dev_unload(struct adapter *padapter)
>  			rtw_stop_drv_threads(padapter);
> =20
>  		while (atomic_read(&pcmdpriv->cmdthd_running)) {
> -			if (cnt > 5) {
> +			if (cnt > 5)
>  				break;
> -			} else {
> -				cnt++;
> -				msleep(10);
> -			}
> +			cnt++;
> +			msleep(10);
>  		}
> =20
>  		/* check the status of IPS */

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
