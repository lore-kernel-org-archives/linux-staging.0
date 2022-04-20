Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7721841;
	Wed, 20 Apr 2022 11:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F898C385A1;
	Wed, 20 Apr 2022 11:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650455885;
	bh=jIZaCR72MF416k5GIz4UoDMTlUaPThfpK+9Q+0zcmnA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NfDGpu1qdTYrgU1CsS4C493/8J8g7H83U69IwcitBhqJRfSidYmtcLEanfyNq6EbH
	 /5j8jbyJHH8uyMGmM3drZuhFOOARrXoDzSm70oiHYofgNXtYaMg2/VNW2z67PhjB0I
	 L4DUYj6f0hTq6Sfnz8HGZXxpjbXVHN0HJugl5dQz+9BLCt7+wJqfKUSEnpiZDs6jNx
	 3gJe4Xxx/tDHdNnl+aFTdYKgEcKP2jUiI+AZRM/L6gbU9nXlrAYlFH0fGiCbef64I1
	 a1ftlEy/XIt2moCYmXDBBveAANFowT7iLF7M/MrDGdBnNUpN+L6ek8sv+HVoGaPnvt
	 hZN/i+uTYH5bA==
From: Kalle Valo <kvalo@kernel.org>
To: Jaehee Park <jhpark1013@gmail.com>
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>,  "David
 S. Miller" <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>,
  Paolo Abeni <pabeni@redhat.com>,  linux-wireless@vger.kernel.org,
  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-staging@lists.linux.dev,  outreachy@lists.linux.dev,  Stefano
 Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH] wfx: use container_of() to get vif
References: <20220418035110.GA937332@jaehee-ThinkPad-X1-Extreme>
Date: Wed, 20 Apr 2022 14:57:57 +0300
In-Reply-To: <20220418035110.GA937332@jaehee-ThinkPad-X1-Extreme> (Jaehee
	Park's message of "Sun, 17 Apr 2022 23:51:10 -0400")
Message-ID: <87y200nf0a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jaehee Park <jhpark1013@gmail.com> writes:

> Currently, upon virtual interface creation, wfx_add_interface() stores
> a reference to the corresponding struct ieee80211_vif in private data,
> for later usage. This is not needed when using the container_of
> construct. This construct already has all the info it needs to retrieve
> the reference to the corresponding struct from the offset that is
> already available, inherent in container_of(), between its type and
> member inputs (struct ieee80211_vif and drv_priv, respectively).
> Remove vif (which was previously storing the reference to the struct
> ieee80211_vif) from the struct wfx_vif, define a function
> wvif_to_vif(wvif) for container_of(), and replace all wvif->vif with
> the newly defined container_of construct.
>
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>

[...]

> +static inline struct ieee80211_vif *wvif_to_vif(struct wfx_vif *wvif)
> +{
> +	return container_of((void *)wvif, struct ieee80211_vif, drv_priv);
> +}

Why the void pointer cast? Avoid casts as much possible.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
