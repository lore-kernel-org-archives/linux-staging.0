Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059303FC0
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 05:35:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632202535; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=d/WbfYzCtCLxGjLS1Fn53umG1vTseNrfK0KHCNl2EuE=;
 b=wHVM+BKuqTAkt9h4gXzRTendEuWOQSYnKIAY1Dl2seNhDwmWYwMklS3dSmGEB5jx2BeSGiGQ
 tCUac4MpkH0zwCnfGYUa5TvSH910oy5zgxIbfVTa+qM/RiutKdR9JMNl8VKYHJ60Ozs52k2I
 YxFDTArURvD8pVV3yXK/TiDnH6Y=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5NGRkNiIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61496f1db585cc7d247d84c4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 05:35:25
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id DA9E4C4360D; Tue, 21 Sep 2021 05:35:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	MISSING_DATE,MISSING_MID,SPF_FAIL,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E2C5C4338F;
	Tue, 21 Sep 2021 05:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8E2C5C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] MAINTAINERS: Move Daniel Drake to credits
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210917102834.25649-1-krzysztof.kozlowski@canonical.com>
References: <20210917102834.25649-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Ulrich Kunitz <kune@deine-taler.de>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-wireless@vger.kernel.org, zd1211-devs@lists.sourceforge.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jens Frederich <jfrederich@gmail.com>,
 Jon Nettleton <jon.nettleton@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Drake <drake@endlessos.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210921053525.DA9E4C4360D@smtp.codeaurora.org>
Date: Tue, 21 Sep 2021 05:35:25 +0000 (UTC)

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:

> Daniel Drake's @gentoo.org email bounces (is listed as retired Gentoo
> developer) and there was no activity from him regarding zd1211rw driver.
> Also his second address @laptop.org bounces.
> 
> Cc: Daniel Drake <drake@endlessos.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Patch applied to wireless-drivers.git, thanks.

91dab18f0df1 MAINTAINERS: Move Daniel Drake to credits

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210917102834.25649-1-krzysztof.kozlowski@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

