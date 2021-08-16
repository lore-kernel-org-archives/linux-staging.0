Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3946D19
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 07:35:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9794161AAB;
	Mon, 16 Aug 2021 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629099304;
	bh=4UvBCT9KXr6J2upY1LQODcEdejQvFBM2K3Uv0EzGMLk=;
	h=From:To:Cc:Subject:Date:From;
	b=BO0H5hnkE0lpMlUgjrPa+t5rvMHi3a8tYQvb+U3VRyBWxeoJgne05hq0j2Y4RqSbt
	 /oE9YuwQq3Rh+jRhnDJqcgauN7QEHZFncUb8J+tDdl26uVLOwrOI4w7f+qcQQcSpwh
	 QZNzMsB9ANX7sHfiY2TxBkrWbo6gmEeyDzUV+D5g=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: fmdefrancesco@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] staging: r8188eu: remove inline markings from functions in rtw_br_ext.c
Date: Mon, 16 Aug 2021 09:34:49 +0200
Message-Id: <20210816073450.668993-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5172; h=from:subject; bh=4UvBCT9KXr6J2upY1LQODcEdejQvFBM2K3Uv0EzGMLk=; b=owGbwMvMwCRo6H6F97bub03G02pJDIlSoqIffnAL7ZLXPzT1wGyfl1u+VK5/XDvfW/xHxN86RdFF xS6eHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRwucMMxnF7grGNu5ZPHu1fDrnav GgpLlWpgwLVqe8Zf795tplH4t/CTzaHAFW5xb1AgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The compiler is free to ignore, or follow, "inline" markings so they
really have no use in .c files, so just remove them.

This allows functions to properly show up as being unused when all
callers to them are removed, otherwise gcc does not warn you about this.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 22737cd0fe44..fb2bb36f9e2c 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -49,7 +49,7 @@
 -----------------------------------------------------------------*/
 
 /* Find a tag in pppoe frame and return the pointer */
-static inline unsigned char *__nat25_find_pppoe_tag(struct pppoe_hdr *ph, unsigned short type)
+static unsigned char *__nat25_find_pppoe_tag(struct pppoe_hdr *ph, unsigned short type)
 {
 	unsigned char *cur_ptr, *start_ptr;
 	unsigned short tagLen, tagType;
@@ -66,7 +66,7 @@ static inline unsigned char *__nat25_find_pppoe_tag(struct pppoe_hdr *ph, unsign
 	return NULL;
 }
 
-static inline int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *tag)
+static int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *tag)
 {
 	struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
 	int data_len;
@@ -106,7 +106,7 @@ static int skb_pull_and_merge(struct sk_buff *skb, unsigned char *src, int len)
 	return 0;
 }
 
-static inline unsigned long __nat25_timeout(struct adapter *priv)
+static unsigned long __nat25_timeout(struct adapter *priv)
 {
 	unsigned long timeout;
 
@@ -115,7 +115,7 @@ static inline unsigned long __nat25_timeout(struct adapter *priv)
 	return timeout;
 }
 
-static inline int  __nat25_has_expired(struct adapter *priv,
+static int  __nat25_has_expired(struct adapter *priv,
 				struct nat25_network_db_entry *fdb)
 {
 	if (time_before_eq(fdb->ageing_timer, __nat25_timeout(priv)))
@@ -124,7 +124,7 @@ static inline int  __nat25_has_expired(struct adapter *priv,
 	return 0;
 }
 
-static inline void __nat25_generate_ipv4_network_addr(unsigned char *networkAddr,
+static void __nat25_generate_ipv4_network_addr(unsigned char *networkAddr,
 				unsigned int *ipAddr)
 {
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
@@ -133,7 +133,7 @@ static inline void __nat25_generate_ipv4_network_addr(unsigned char *networkAddr
 	memcpy(networkAddr+7, (unsigned char *)ipAddr, 4);
 }
 
-static inline void __nat25_generate_ipx_network_addr_with_node(unsigned char *networkAddr,
+static void __nat25_generate_ipx_network_addr_with_node(unsigned char *networkAddr,
 				__be32 *ipxNetAddr, unsigned char *ipxNodeAddr)
 {
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
@@ -143,7 +143,7 @@ static inline void __nat25_generate_ipx_network_addr_with_node(unsigned char *ne
 	memcpy(networkAddr+5, ipxNodeAddr, 6);
 }
 
-static inline void __nat25_generate_ipx_network_addr_with_socket(unsigned char *networkAddr,
+static void __nat25_generate_ipx_network_addr_with_socket(unsigned char *networkAddr,
 				__be32 *ipxNetAddr, __be16 *ipxSocketAddr)
 {
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
@@ -153,7 +153,7 @@ static inline void __nat25_generate_ipx_network_addr_with_socket(unsigned char *
 	memcpy(networkAddr+5, ipxSocketAddr, 2);
 }
 
-static inline void __nat25_generate_apple_network_addr(unsigned char *networkAddr,
+static void __nat25_generate_apple_network_addr(unsigned char *networkAddr,
 				__be16 *network, unsigned char *node)
 {
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
@@ -163,7 +163,7 @@ static inline void __nat25_generate_apple_network_addr(unsigned char *networkAdd
 	networkAddr[3] = *node;
 }
 
-static inline void __nat25_generate_pppoe_network_addr(unsigned char *networkAddr,
+static void __nat25_generate_pppoe_network_addr(unsigned char *networkAddr,
 				unsigned char *ac_mac, __be16 *sid)
 {
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
@@ -258,7 +258,7 @@ static int update_nd_link_layer_addr(unsigned char *data, int len, unsigned char
 	return 0;
 }
 
-static inline int __nat25_network_hash(unsigned char *networkAddr)
+static int __nat25_network_hash(unsigned char *networkAddr)
 {
 	if (networkAddr[0] == NAT25_IPV4) {
 		unsigned long x;
@@ -305,7 +305,7 @@ static inline int __nat25_network_hash(unsigned char *networkAddr)
 	}
 }
 
-static inline void __network_hash_link(struct adapter *priv,
+static void __network_hash_link(struct adapter *priv,
 				struct nat25_network_db_entry *ent, int hash)
 {
 	/*  Caller must spin_lock already! */
@@ -316,7 +316,7 @@ static inline void __network_hash_link(struct adapter *priv,
 	ent->pprev_hash = &priv->nethash[hash];
 }
 
-static inline void __network_hash_unlink(struct nat25_network_db_entry *ent)
+static void __network_hash_unlink(struct nat25_network_db_entry *ent)
 {
 	/*  Caller must spin_lock already! */
 	*ent->pprev_hash = ent->next_hash;
-- 
2.32.0

