Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B823FC3
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 09:05:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632042320; h=Content-Type: MIME-Version: Message-ID: Date:
 References: In-Reply-To: Subject: Cc: To: From: Sender;
 bh=C2SJzDFioL6x/Cj6RdueyKoBo3DX6Vzq7xa4jPC31l4=; b=eH/J+Kyo8LI75coIDbgaYCLe3H7gLIJpzWzO3JyLFwQvucBmqbSIYKvUgsLudHPA9iCW+fuq
 v8qbWf926A0OOWuIAIDGlqGw2VDn+QKhP9B80+uKg01sbHJnoLmEjH56+cssaS/720iL+kK5
 96OgyBq2SDgzMU4CZKockeyAelQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5NGRkNiIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6146fd4e65c3cc8c63ac8cda (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 19 Sep 2021 09:05:18
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 5B8FBC43460; Sun, 19 Sep 2021 09:05:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B8F7C4338F;
	Sun, 19 Sep 2021 09:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4B8F7C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,  Ulrich Kunitz <kune@deine-taler.de>,  "David S. Miller" <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>,  linux-wireless@vger.kernel.org,  zd1211-devs@lists.sourceforge.net,  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  Jens Frederich <jfrederich@gmail.com>,  Jon Nettleton <jon.nettleton@gmail.com>,  linux-staging@lists.linux.dev,  Daniel Drake <drake@endlessos.org>
Subject: Re: [PATCH v2] MAINTAINERS: Move Daniel Drake to credits
In-Reply-To: <YUSZy0fH0oKuFsLV@kroah.com> (Greg Kroah-Hartman's message of
	"Fri, 17 Sep 2021 15:36:11 +0200")
References: <20210917102834.25649-1-krzysztof.kozlowski@canonical.com>
	<YUSZy0fH0oKuFsLV@kroah.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Sun, 19 Sep 2021 12:05:11 +0300
Message-ID: <875yuxx7eg.fsf@codeaurora.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Fri, Sep 17, 2021 at 12:28:34PM +0200, Krzysztof Kozlowski wrote:
>> Daniel Drake's @gentoo.org email bounces (is listed as retired Gentoo
>> developer) and there was no activity from him regarding zd1211rw driver.
>> Also his second address @laptop.org bounces.
>> 
>> Cc: Daniel Drake <drake@endlessos.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks. I assume it's ok for everyone that I take this to
wireless-drivers.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
